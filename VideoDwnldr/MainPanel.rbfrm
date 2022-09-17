#tag Window
Begin ContainerControl MainPanel
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   400
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   ""
   LockBottom      =   ""
   LockLeft        =   ""
   LockRight       =   ""
   LockTop         =   ""
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   ""
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   600
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Descarga\rHistorial\rConfiguración"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin DownloadPanel DownloadPanel1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   False
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   360
         HelpTag         =   ""
         InitialParent   =   "TabPanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   40
         UseFocusRing    =   ""
         Visible         =   True
         Width           =   598
      End
      Begin HistoryPanel HistoryPanel1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   360
         HelpTag         =   ""
         InitialParent   =   "TabPanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   40
         UseFocusRing    =   ""
         Visible         =   True
         Width           =   598
      End
      Begin ConfigPanel ConfigPanel1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   362
         HelpTag         =   ""
         InitialParent   =   "TabPanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   38
         UseFocusRing    =   ""
         Visible         =   True
         Width           =   598
      End
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   -30
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -30
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim f As FolderItem= PreferencesFile
		  If Not f.Exists Then CreatePreferencesFile(f)
		  
		  Dim folderYoutubeDl As FolderItem= SpecialFolder.ApplicationData.Child(BrandName).Child(kYoutubedl)
		  If Not folderYoutubeDl.Exists Then folderYoutubeDl.CreateAsFolder
		  
		  Dim folderFfmpeg As FolderItem= SpecialFolder.ApplicationData.Child(BrandName).Child(kFfmpeg)
		  If Not folderFfmpeg.Exists Then folderFfmpeg.CreateAsFolder
		  
		  YoutubeDlFile= folderYoutubeDl.Child("youtube-dl.exe")
		  FfmpegFile= folderFfmpeg.Child("ffmpeg.exe")
		  
		  Dim json As JSONData= PreferencesFile.OpenAsJSONData
		  
		  // set downloadPanel:
		  DownloadPanel1.PanelMain= Self
		  DownloadPanel1.PanelHistory= HistoryPanel1
		  DownloadPanel1.YoutubeDlFile= YoutubeDlFile
		  DownloadPanel1.FfmpegFile= FfmpegFile
		  DownloadPanel1.VideosFolder= New FolderItem(json.Value(kVideos_folder).StringValue, FolderItem.PathTypeShell)
		  
		  // set configPanel:
		  If True Then
		    Dim names() As String= json.Names
		    For Each name As String In names
		      If Not json.Value(name) IsA JSONData Then
		        ConfigPanel1.Listbox1.AddRow name, json.Value(name).StringValue
		      End If
		    Next
		    ConfigPanel1.PreferencesFile= PreferencesFile
		  End If
		  
		  If YoutubeDlFile.Exists And FfmpegFile.Exists Then
		    DownloadPanel1.Enabled= True
		    DownloadPanel1.BevelButton1.SetFocus
		    Return
		  End If
		  
		  If Not YoutubeDlFile.Exists Then
		    Dim dfy As New DownloadFile
		    AddHandler dfy.Progress, WeakAddressOf dfProgress
		    AddHandler dfy.TransferComplete, WeakAddressOf dfTransferComplete
		    dfy.DownloadType= DownloadFile.TypeDownload.Youtube_dl
		    dfy.TmpFile= GetTemporaryFolderItem
		    dfy.TmpBs= BinaryStream.Create(dfy.TmpFile, True)
		    dfy.FinalFolderItem= YoutubeDlFile
		    dfy.Get json.Value(kUrl_youtube_dl).StringValue, dfy.TmpBs
		    DownloadFiles.Append dfy
		    
		    HistoryPanel1.Listbox1.AddRow json.Value(kUrl_youtube_dl).StringValue
		    dfy.Idx= HistoryPanel1.Listbox1.LastIndex
		    dfy.IsRunning= True
		  End If
		  
		  If Not FfmpegFile.Exists Then
		    Dim dff As New DownloadFile
		    AddHandler dff.Progress, WeakAddressOf dfProgress
		    AddHandler dff.TransferComplete, WeakAddressOf dfTransferComplete
		    dff.DownloadType= DownloadFile.TypeDownload.Ffmpeg
		    dff.TmpFile= GetTemporaryFolderItem
		    dff.TmpBs= BinaryStream.Create(dff.TmpFile, True)
		    dff.FinalFolderItem= folderFfmpeg
		    dff.Get json.Value(kUrl_ffmpeg).StringValue, dff.TmpBs
		    DownloadFiles.Append dff
		    
		    HistoryPanel1.Listbox1.AddRow json.Value(kUrl_ffmpeg).StringValue
		    dff.Idx= HistoryPanel1.Listbox1.LastIndex
		    dff.IsRunning= True
		  End If
		  
		  TabPanel1.Value= 1
		  
		  If Timer1.Mode= Timer.ModeOff Then
		    Timer1.Mode= Timer1.ModeMultiple
		    Timer1.Enabled= True
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CreatePreferencesFile(f As FolderItem)
		  Dim json As New JSONData
		  json.Compact= False
		  
		  json.Value(kUrl_youtube_dl)= "https://www.dropbox.com/s/ibq3eq8cy2hp584/youtube-dl.exe?dl=1"
		  json.Value(kUrl_ffmpeg)= "https://www.dropbox.com/s/ue2z3b7q7372mgs/ffmpeg-win-2.2.2.zip?dl=1"
		  json.Value(kVideos_folder)= SpecialFolder.Movies.AbsoluteNativePath
		  
		  Dim tos As TextOutputStream= TextOutputStream.Create(f)
		  tos.Write json.ToString
		  tos.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function dfProgress(o As DownloadFile, dlTotal As Int64, dlNow As Int64, ulTotal As Int64, ulNow As Int64) As Boolean
		  'System.DebugLog CurrentMethodName+ " "+ o.TmpFile.AbsoluteNativePath+ _
		  '" dlNow: "+ Str(dlNow)
		  
		  If o.Idx<> -1 Then
		    Dim perc As Integer= dlNow* 100/ dlTotal
		    HistoryPanel1.Listbox1.Cell(o.Idx, 1)= Str(perc, "###")+ "% of "+ Str(dlTotal)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub dfTransferComplete(o As DownloadFile, BytesRead As Integer, BytesWritten As Integer)
		  'System.DebugLog CurrentMethodName+ " "+ o.TmpFile.AbsoluteNativePath
		  
		  If o.DownloadType= DownloadFile.TypeDownload.Youtube_dl Then
		    o.TmpFile.CopyFileTo o.FinalFolderItem
		  ElseIf o.DownloadType= DownloadFile.TypeDownload.Ffmpeg Then
		    Try
		      Dim files() As FolderItem= PKZip.ReadZip(o.TmpFile, o.FinalFolderItem.Parent)
		      o.FinalFolderItem.Delete
		      For i As Integer= 0 To files.Ubound
		        Dim file As FolderItem= files(i)
		        If file.Directory And file.Name.InStr("ffmpeg-")> 0 Then
		          file.Name= "ffmpeg"
		          FfmpegFile= file.Child("ffmpeg.exe")
		          Exit
		        End If
		      Next
		    Catch e As RuntimeException
		      System.DebugLog CurrentMethodName+ " e.Message: "+ e.Message
		    End Try
		  ElseIf o.DownloadType= DownloadFile.TypeDownload.Vcredist Then
		    Try
		      Dim files() As FolderItem= PKZip.ReadZip(o.TmpFile, o.FinalFolderItem)
		    Catch e As RuntimeException
		      System.DebugLog CurrentMethodName+ " e.Message: "+ e.Message
		    End Try
		  End If
		  
		  If YoutubeDlFile.Exists And FfmpegFile.Exists Then
		    DownloadPanel1.Enabled= True
		  End If
		  
		  HistoryPanel1.Listbox1.Cell(o.Idx, 1)= "Completado!"
		  
		  o.IsRunning= False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DownloadVcredist()
		  Const kUrl_vcredist= "https://www.dropbox.com/s/p978euou1auz4vy/vcredist_100.zip?dl=1"
		  
		  Dim folderYoutubeDl As FolderItem= SpecialFolder.ApplicationData.Child(BrandName).Child(kYoutubedl)
		  
		  Dim dfv As New DownloadFile
		  AddHandler dfv.Progress, WeakAddressOf dfProgress
		  AddHandler dfv.TransferComplete, WeakAddressOf dfTransferComplete
		  dfv.DownloadType= DownloadFile.TypeDownload.Vcredist
		  dfv.TmpFile= GetTemporaryFolderItem
		  dfv.TmpBs= BinaryStream.Create(dfv.TmpFile, True)
		  dfv.FinalFolderItem= folderYoutubeDl
		  dfv.Get kUrl_vcredist, dfv.TmpBs
		  DownloadFiles.Append dfv
		  
		  HistoryPanel1.Listbox1.AddRow kUrl_vcredist
		  dfv.Idx= HistoryPanel1.Listbox1.LastIndex
		  dfv.IsRunning= True
		  
		  TabPanel1.Value= 1
		  
		  If Timer1.Mode= Timer.ModeOff Then
		    Timer1.Mode= Timer1.ModeMultiple
		    Timer1.Enabled= True
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BrandName As String = "VideoDwnldr"
	#tag EndProperty

	#tag Property, Flags = &h0
		DownloadFiles() As DownloadFile
	#tag EndProperty

	#tag Property, Flags = &h0
		FfmpegFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreferencesFile As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPreferencesFile Is Nil Then
			    Dim f As FolderItem
			    Try
			      #pragma BreakOnExceptions Off
			      f= SpecialFolder.ApplicationData.Child(BrandName)
			      #pragma BreakOnExceptions On
			    Catch e As RunTimeException
			      System.DebugLog CurrentMethodName+ " error: "+ e.Message
			    End Try
			    
			    If f Is Nil Then // sanity chk
			      f= SpecialFolder.Temporary.Child(BrandName+ "_Preferences.json")
			    Else
			      If Not f.Exists Then f.CreateAsFolder
			      f= SpecialFolder.ApplicationData.Child(BrandName).Child("Preferences.json")
			    End If
			    
			    mPreferencesFile= f
			  End If
			  
			  Return mPreferencesFile
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPreferencesFile = value
			End Set
		#tag EndSetter
		PreferencesFile As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		YoutubeDlFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = kFfmpeg, Type = String, Dynamic = False, Default = \"ffmpeg", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUrl_ffmpeg, Type = String, Dynamic = False, Default = \"url_ffmpeg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUrl_youtube_dl, Type = String, Dynamic = False, Default = \"url_youtube_dl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVideos_folder, Type = String, Dynamic = False, Default = \"videos_folder", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kYoutubedl, Type = String, Dynamic = False, Default = \"youtube-dl", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  Dim idxs() As Integer
		  
		  For i As Integer= 0 To DownloadFiles.Ubound
		    Dim df As DownloadFile= DownloadFiles(i)
		    If Not df.IsRunning Then
		      RemoveHandler df.Progress, WeakAddressOf dfProgress
		      RemoveHandler df.TransferComplete, WeakAddressOf dfTransferComplete
		      idxs.Append i
		    End If
		  Next
		  
		  For Each idx As Integer In idxs
		    DownloadFiles.Remove idx
		    'System.DebugLog CurrentMethodName+ " DownloadFiles.Remove "+ Str(idx)
		  Next
		  
		  If DownloadFiles.Ubound= -1 Then
		    Me.Mode= Timer.ModeOff
		    'System.DebugLog CurrentMethodName+ " Me.Mode= Timer.ModeOff"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
