#tag Window
Begin ContainerControl DownloaderPanel
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
   Begin TabPanel MainTabPanel
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
      TabDefinition   =   "#kLocDownload\r#kLocHistory\r#kLocConfig"
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
         InitialParent   =   "MainTabPanel"
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
         InitialParent   =   "MainTabPanel"
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
         InitialParent   =   "MainTabPanel"
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim youtubeExec As FolderItem= VideoDl.Youtube.Executable
		  If youtubeExec Is Nil Then
		    DownloadYoutubeDl
		    Return
		  ElseIf Not youtubeExec.Exists Then
		    DownloadYoutubeDl
		    Return
		  End If
		  
		  Dim ffmpegExec As FolderItem= VideoDl.FFmpeg.Executable
		  If ffmpegExec Is Nil Then
		    DownloadFFmpeg
		    Return
		  ElseIf Not ffmpegExec.Exists Then
		    DownloadFFmpeg
		    Return
		  End If
		  
		  DownloadPanel1.Enabled= True
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DownloadFFmpeg()
		  MsgBox "Download ffmpeg!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadYoutubeDl()
		  MsgBox "Download YoutubeDl!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerAssets(assets() As VideoDl.IAsset)
		  If assets.Ubound= -1 Then
		    MsgBox "error!"
		    DownloadPanel1.CheckBtn.Enabled= True
		    Return
		  End If
		  
		  Dim list As Listbox= DownloadPanel1.FormatsLbx
		  list.DeleteAllRows
		  
		  For Each asset As VideoDl.IAsset In assets
		    Dim json As JSONData= asset.Info
		    list.AddRow json.Value("ext").StringValue, json.Value("resolution").StringValue, json.Value("moreinfo").StringValue
		    list.RowTag(list.LastIndex)= asset
		  Next
		  
		  DownloadPanel1.CheckBtn.Enabled= True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerCompleted(fileTemp As FolderItem, idx As Integer)
		  If fileTemp Is Nil Then
		    MsgBox "error!"
		    Return
		  End If
		  
		  HistoryPanel1.HistoryLbx.Cell(idx, 0)= fileTemp.AbsoluteNativePath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerMergeCompleted(fileTemp As FolderItem, idx As Integer)
		  HistoryPanel1.MergeBtn.Enabled= True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
		  HistoryPanel1.HistoryLbx.Cell(idx, 1)= msg
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mVideoMerge As VideoDl.FFmpeg
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoSource As VideoDl.ISource
	#tag EndProperty


	#tag Constant, Name = kLocCompleted, Type = String, Dynamic = True, Default = \"Completed!", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Completado!"
	#tag EndConstant

	#tag Constant, Name = kLocConfig, Type = String, Dynamic = True, Default = \"Configuration", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Configuraci\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = kLocDownload, Type = String, Dynamic = True, Default = \"Download", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Descarga"
	#tag EndConstant

	#tag Constant, Name = kLocHistory, Type = String, Dynamic = True, Default = \"History", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Historial"
	#tag EndConstant


#tag EndWindowCode

#tag Events DownloadPanel1
	#tag Event
		Sub CheckPressed()
		  If Me.UrlTxf.Text.Len= 0 Then
		    MsgBox Me.kLocMsgWFAD
		    Me.UrlTxf.SetFocus
		    Return
		  End If
		  
		  Me.CheckBtn.Enabled= False
		  
		  mVideoSource= New VideoDl.Youtube(Me.UrlTxf.Text)
		  mVideoSource.SetAssetsAction WeakAddressOf HandlerAssets
		  mVideoSource.Start
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadPressed()
		  If Me.FormatsLbx.ListCount= 0 Then
		    MsgBox Me.kLocMsgCVRA
		    Return
		  End If
		  
		  Dim asset As VideoDl.IAsset= Me.FormatsLbx.RowTag(Me.FormatsLbx.ListIndex)
		  Dim json As JSONData= asset.Info
		  Dim file As VideoDl.IFile
		  
		  Select Case Me.QualityCmb.Text
		  Case Me.kLocBestQuality
		    file= New VideoDl.YoutubeFile(json.Value("url").StringValue, "bestvideo+bestaudio")
		  Case Me.kLocWorstQuality
		    file= New VideoDl.YoutubeFile(json.Value("url").StringValue, "worstvideo+worstaudio")
		  Case Else
		    file= asset.File
		  End Select
		  
		  Dim list As Listbox= HistoryPanel1.HistoryLbx
		  list.AddRow Me.kLocInit
		  list.RowTag(list.LastIndex)= file
		  VideoDl.YoutubeFile(file).Idx= list.LastIndex
		  
		  file.SetProgressAction WeakAddressOf HandlerProgress
		  file.SetCompletedAction WeakAddressOf HandlerCompleted
		  file.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HistoryPanel1
	#tag Event
		Sub MergePressed()
		  Dim list As Listbox= Me.HistoryLbx
		  
		  If list.ListCount= 0 Then
		    MsgBox Me.kLocMustBeSelectedTwoFiles
		    Return
		  End If
		  
		  Dim inputFiles() As FolderItem
		  For i As Integer= 0 To list.ListCount- 1
		    If list.Selected(i) Then inputFiles.Append(New FolderItem(list.Cell(i, 0)))
		  Next
		  
		  If inputFiles.Ubound<> 1 Then
		    MsgBox Me.kLocMustBeSelectedTwoFiles
		    Return
		  End If
		  
		  Dim outputFile As FolderItem
		  Try
		    outputFile= New FolderItem(Me.NameTxf.Text)
		  Catch exc As RuntimeException
		    MsgBox Me.kLocInvalidFileName
		    Return
		  End Try
		  
		  Me.MergeBtn.Enabled= False
		  
		  mVideoMerge= New VideoDl.FFmpeg
		  For Each file As FolderItem In inputFiles
		    mVideoMerge.Add file
		  Next
		  mVideoMerge.SetCompletedAction WeakAddressOf HandlerMergeCompleted
		  mVideoMerge.Merge outputFile
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConfigPanel1
	#tag Event
		Sub Open()
		  Dim pref As New VideoDl.Preferences
		  Dim json As JSONData= pref.File.OpenAsJSONData
		  
		  Dim names() As String= json.Names
		  For Each name As String In names
		    Me.PropsLbx.AddRow name, json.Value(name).StringValue
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub SavePressed()
		  Dim pref As New VideoDl.Preferences
		  Dim json As JSONData= pref.File.OpenAsJSONData
		  Dim changed As Boolean
		  
		  For i As Integer= 0 To Me.PropsLbx.ListCount- 1
		    Dim name As String= Me.PropsLbx.Cell(i, 0)
		    Dim value As String= Me.PropsLbx.Cell(i, 1)
		    If json.HasName(name) Then
		      If json.Value(name).StringValue<> value Then
		        json.Value(name)= value
		        changed= True
		      End If
		    Else
		      json.Value(name)= value
		      changed= True
		    End If
		  Next
		  
		  If changed Then json.Save pref.File
		End Sub
	#tag EndEvent
#tag EndEvents
