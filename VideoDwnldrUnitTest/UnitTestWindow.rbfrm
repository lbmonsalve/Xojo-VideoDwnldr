#tag Window
Begin Window UnitTestWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   97988607
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "UnitTest"
   Visible         =   True
   Width           =   800
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   600
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
      TabDefinition   =   "UnitTest\rTest"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   1
      Visible         =   True
      Width           =   800
      Begin UnitTestPanel UnitTestPanel1
         AcceptFocus     =   ""
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   550
         HelpTag         =   ""
         InitialParent   =   "TabPanel1"
         Left            =   15
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   38
         UseFocusRing    =   ""
         Visible         =   True
         Width           =   770
      End
      Begin PushButton PushButton1
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Test"
         Default         =   ""
         Enabled         =   True
         Height          =   30
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   30
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   16
         TextUnit        =   0
         Top             =   60
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PushButton2
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "File"
         Default         =   ""
         Enabled         =   True
         Height          =   30
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   122
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   16
         TextUnit        =   0
         Top             =   60
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
   End
   Begin Shell Cmd
      Arguments       =   ""
      Backend         =   ""
      Height          =   32
      Index           =   -2147483648
      Left            =   -44
      LockedInPosition=   False
      Mode            =   1
      Scope           =   0
      TabPanelIndex   =   0
      TimeOut         =   ""
      Top             =   -69
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  For Each file As VideoDl.IFile In mDownloadFiles
		    file= Nil
		  Next
		  
		  ReDim mDownloadFiles(-1)
		  
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Resized()
		  #if RBVersion< 2014
		    UnitTestPanel1.Refresh
		  #endif
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClearAll() As Boolean Handles EditClearAll.Action
			UnitTestPanel1.SelectAllGroups(False, False)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSelectAll() As Boolean Handles EditSelectAll.Action
			UnitTestPanel1.SelectAllGroups(True, False)
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub DownloadCompleted(fileTemp As FolderItem, idx As Integer)
		  System.DebugLog fileTemp.Name+ " completed!"
		  
		  PushButton2.Enabled= True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
		  If bytesTotal> 0 Then
		    Dim perc As String= " ("+ Str(bytesNow* 100/ bytesTotal, "###")+ "%)"
		    System.DebugLog Str(bytesNow)+ "bytes de "+ Str(bytesTotal)+ perc
		  Else
		    System.DebugLog CurrentMethodName+ " msg: "+ msg
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerAssets(assets() As VideoDl.IAsset)
		  mVideoAssets= assets
		  
		  PushButton1.Enabled= True
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDownloadFiles() As VideoDl.IFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFFmpegMerge As VideoDl.FFmpeg
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoAssets() As VideoDl.IAsset
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoFile As VideoDl.IFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoSource As VideoDl.ISource
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  'If mFFmpegMerge Is Nil Then
		  'mFFmpegMerge= New VideoDl.FFmpeg
		  'mFFmpegMerge.Add SpecialFolder.Movies.Child("Scott Spark RC de Nino Schurter 🚀 #shorts #mtb-AA9Ybq5in-c.m4a")
		  'mFFmpegMerge.Add SpecialFolder.Movies.Child("Scott Spark RC de Nino Schurter 🚀 #shorts #mtb-AA9Ybq5in-c.mp4")
		  'mFFmpegMerge.Merge SpecialFolder.Movies.Child("Nino.mp4")
		  'Else
		  'mFFmpegMerge= Nil
		  'End If
		  
		  
		  'If mVideoSource Is Nil Then
		  'Me.Enabled= False
		  'mVideoSource= New VideoDl.Youtube("https://youtu.be/AA9Ybq5in-c")
		  'mVideoSource.SetAssetsAction WeakAddressOf HandlerAssets
		  'mVideoSource.Start
		  'Else
		  'mVideoSource= Nil
		  'End If
		  
		  
		  'Me.Enabled= False
		  'Dim yt As FolderItem= SpecialFolder.Documents.Child("Temp").Child("yt-dlp.exe")
		  'Dim ff As FolderItem= SpecialFolder.Documents.Child("Temp").Child("ffmpeg")
		  'Dim mv As FolderItem= SpecialFolder.Movies
		  'Dim cmdStr As String= yt.ShellPath+ " --verbose --encoding utf-8 -f {ID} --ffmpeg-location {LOC} -o {FMTOUT} {URL}"
		  'cmdStr= cmdStr.Replace("{ID}", "597").Replace("{LOC}", ff.ShellPath).Replace("{FMTOUT}", mv.ShellPath+ "\%(title)s-%(id)s.%(ext)s")
		  'cmdStr= cmdStr.Replace("{URL}", "https://youtu.be/AA9Ybq5in-c")
		  'Cmd.Execute cmdStr
		  
		  
		  'Dim yt As FolderItem= SpecialFolder.Documents.Child("Temp").Child("yt-dlp.exe")
		  'Dim cmdStr As String= yt.ShellPath+ " --verbose -F {URL}"
		  'cmdStr= cmdStr.Replace("{URL}", "https://youtu.be/AA9Ybq5in-c")
		  'Cmd.Execute cmdStr
		  
		  
		  'VideoDl.Youtube.Executable= SpecialFolder.Documents.Child("Temp").Child("yt-dlp.exe")
		  'Dim yt As New VideoDl.Youtube("https://youtu.be/AA9Ybq5in-c")
		  'Dim s1 As String= yt.VersionExecutable
		  'If s1<> VideoDl.Youtube.VersionExpected Then
		  'Break
		  'End If
		  
		  'Dim mgr As New VideoDl.Manager(yt)
		  'mgr.Assets WeakAddressOf handlerAssets
		  'Break
		  
		  
		  'Dim pfile As New VideoDl.Preferences
		  'Dim json As JSONData= pFile.File.OpenAsJSONData
		  'Break
		  
		  
		  'Const kUrlYoutubeDl= "https://www.dropbox.com/s/ibq3eq8cy2hp584/youtube-dl.exe?dl=1"
		  Const kUrlFFmpeg= "https://www.dropbox.com/s/ue2z3b7q7372mgs/ffmpeg-win-2.2.2.zip?dl=1"
		  'Const kUrlVcredist= "https://www.dropbox.com/s/p978euou1auz4vy/vcredist_100.zip?dl=1"
		  '
		  'Dim youtubeFile As VideoDl.IFile= New VideoDl.FileDownloaderYoutubeDl(kUrlYoutubeDl, SpecialFolder.Documents)
		  'youtubeFile.SetProgressAction(WeakAddressOf DownloadProgress)
		  'youtubeFile.SetCompletedAction(WeakAddressOf DownloadCompleted)
		  'youtubeFile.Start
		  'mDownloadFiles.Append youtubeFile
		  '
		  Dim ffmpegFile As VideoDl.IFile= New VideoDl.FileDownloaderFFmpeg(kUrlFFmpeg, SpecialFolder.Documents)
		  ffmpegFile.SetProgressAction(WeakAddressOf DownloadProgress)
		  ffmpegFile.SetCompletedAction(WeakAddressOf DownloadCompleted)
		  ffmpegFile.Start
		  mDownloadFiles.Append ffmpegFile
		  '
		  'Dim vcredistFile As VideoDl.IFile= New VideoDl.FileDownloaderVcredist(kUrlVcredist, SpecialFolder.Documents)
		  'vcredistFile.SetProgressAction(WeakAddressOf DownloadProgress)
		  'vcredistFile.SetCompletedAction(WeakAddressOf DownloadCompleted)
		  'vcredistFile.Start
		  'mDownloadFiles.Append vcredistFile
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  If mVideoAssets.Ubound= -1 Then Return
		  If Not (mVideoFile Is Nil) Then
		    mVideoFile= Nil
		    Return
		  End If
		  
		  Me.Enabled= False
		  
		  Dim asset As VideoDl.IAsset= mVideoAssets(11)
		  mVideoFile= asset.File
		  mVideoFile.SetProgressAction WeakAddressOf DownloadProgress
		  mVideoFile.SetCompletedAction WeakAddressOf DownloadCompleted
		  mVideoFile.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Cmd
	#tag Event
		Sub Completed()
		  If Me.ErrorCode<> 0 Then
		    MsgBox "error!"
		    PushButton1.Enabled= True
		    Return
		  End If
		  
		  'Dim out As String= Me.ReadAll.DefineEncoding(Encodings.UTF8)
		  '
		  'Dim lines() As String= out.Split(EndOfLine.UNIX)
		  'Dim frmts() As String
		  'Dim addFrmts As Boolean
		  '
		  'For Each line As String In lines
		  'If addFrmts And line.Len> 0 Then
		  'If line.InStr("ID ")= 0 And line.InStr("---")= 0 Then
		  'frmts.Append line
		  'End If
		  'ElseIf line.InStr("[info]")> 0 Then
		  'addFrmts= True
		  'End If
		  'Next
		  '
		  'Dim json As New JSONData
		  '
		  'For Each frmt As String In frmts
		  'Dim elem As New JSONData
		  'elem.Value("id")= frmt.Mid(1, 3).Trim
		  'elem.Value("ext")= frmt.Mid(5, 5).Trim
		  'elem.Value("resolution")= frmt.Mid(11, 11).Trim
		  'elem.Value("fps")= frmt.Mid(23, 3).Trim
		  'elem.Value("channels")= frmt.Mid(26, 2).Trim
		  'elem.Value("fileSize")= frmt.Mid(30, 9).Trim
		  'elem.Value("bitrate")= frmt.Mid(42, 4).Trim
		  'elem.Value("protocol")= frmt.Mid(48, 5).Trim
		  'elem.Value("vcodec")= frmt.Mid(56, 17).Trim
		  'elem.Value("acodec")= frmt.Mid(74, 19).Trim
		  'elem.Value("moreinfo")= frmt.Mid(94).Trim
		  'json.Append elem
		  'Next
		  '
		  'Break
		  
		  PushButton1.Enabled= True
		End Sub
	#tag EndEvent
	#tag Event
		Sub DataAvailable()
		  Const kTagDownload= "[download]"
		  Const kTagDownloaded= "has already been downloaded"
		  Const kTagDestination= "Destination:"
		  
		  Dim out As String= Me.ReadAll.DefineEncoding(Encodings.UTF8)
		  Dim lines() As String= out.Split(EndOfLine.UNIX)
		  
		  For Each line As String In lines
		    If line.Trim.Len= 0 Then Continue
		    Dim pos As Integer= line.InStr(kTagDownload)
		    If pos= 0 Then Continue
		    Dim posTemp As Integer= line.InStr(kTagDownloaded)
		    If posTemp> 0 Then
		      Dim filePath As String= line.Mid(pos+ 10, posTemp- 10).Trim
		      Dim file As New FolderItem(filePath, FolderItem.PathTypeShell)
		      System.DebugLog CurrentMethodName+ " file: ("+ file.DisplayName+ ") "+ kTagDownloaded
		      Return
		    End If
		    posTemp= line.InStr(kTagDestination)
		    If posTemp> 0 Then
		      Dim filePath As String= line.Mid(posTemp+ 12).Trim
		      Dim file As New FolderItem(filePath, FolderItem.PathTypeShell)
		      System.DebugLog CurrentMethodName+ " file: ("+ file.DisplayName+ ")"
		    Else
		      Dim msgs() As String= line.Split(kTagDownload)
		      For Each msg As String In msgs
		        If msg.Trim.Len= 0 Then Continue
		        System.DebugLog CurrentMethodName+ " msg: "+ msg
		      Next
		    End If
		  Next
		  
		  //[3352] DownloadPanel.CmdDataAvailable result: [download] C:\Users\Usuario\DOWNLO~1\16 de septiembre de 2022-7hB9N24nqEU.mp4 has already been downloaded
		  //[2020] [download] C:\Users\Usuario\DOWNLO~1\16 de septiembre de 2022-best-7hB9N24nqEU.mkv has already been downloaded and merged
		  
		End Sub
	#tag EndEvent
#tag EndEvents
