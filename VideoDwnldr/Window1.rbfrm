#tag Window
Begin Window Window1
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   625008639
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Video downloader"
   Visible         =   True
   Width           =   600
   Begin DownloaderPanel DownloaderPanel1
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
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			MsgBox kLocAbout.Replace("$1", App.ShortVersion).Replace("$2", VideoDl.Youtube.VersionExecutable)
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Constant, Name = kLocAbout, Type = String, Dynamic = True, Default = \"VideoDwnldr \xC2\xA92023\r\rApp: $1\ryt: $2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocWaitToDownloadSupportFiles, Type = String, Dynamic = True, Default = \"Wait to download support files...", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Espere terminar descarga archivos soporte..."
	#tag EndConstant

	#tag Constant, Name = kLocWaitToDownloadVideos, Type = String, Dynamic = True, Default = \"Wait to download video(s)...", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Espere terminar descarga video(s)..."
	#tag EndConstant


#tag EndWindowCode

