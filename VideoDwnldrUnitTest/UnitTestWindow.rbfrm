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
   End
End
#tag EndWindow

#tag WindowCode
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
		Private Sub DownloadCompleted(fileTemp As FolderItem)
		  MsgBox "Completed!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadProgress(bytesTotal As Uint64, bytesNow As Uint64)
		  Dim perc As String= " ("+ Str(bytesNow* 100/ bytesTotal, "###")+ "%)"
		  
		  System.DebugLog Str(bytesNow)+ "bytes de "+ Str(bytesTotal)+ perc
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mTestFile As VideoDl.IFileDownloader
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Const kYoutubeDlUrl= "https://www.dropbox.com/s/ibq3eq8cy2hp584/youtube-dl.exe?dl=1"
		  Const kFFmpegUrl= "https://www.dropbox.com/s/ue2z3b7q7372mgs/ffmpeg-win-2.2.2.zip?dl=1"
		  
		  If mTestFile Is Nil Then
		    mTestFile= New VideoDl.FileDownloaderYoutubeDl(kYoutubeDlUrl, SpecialFolder.Documents)
		    'mTestFile= New VideoDl.FileDownloaderFFmpeg(kFFmpegUrl, SpecialFolder.Documents)
		    mTestFile.SetProgressAction(WeakAddressOf DownloadProgress)
		    mTestFile.SetCompletedAction(WeakAddressOf DownloadCompleted)
		    mTestFile.Start
		  End If
		  
		  'Break
		End Sub
	#tag EndEvent
#tag EndEvents
