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
   Begin MainPanel MainPanel1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      BrandName       =   "VideoDwnldr"
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
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If MainPanel1.DownloadFiles.Ubound> -1 Then
		    MsgBox kLocWaitToDownloadSupportFiles
		    Return True
		  End If
		  
		  If MainPanel1.DownloadPanel1.Cmds.Ubound> -1 Then
		    MsgBox kLocWaitToDownloadVideos
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			MsgBox kLocAbout+ App.ShortVersion
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Constant, Name = kLocAbout, Type = String, Dynamic = True, Default = \"VideoDownldr \xC2\xA92023\r\rVersion: ", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"VideoDownldr \xC2\xA92023\r\n\r\nVersi\xC3\xB3n: "
	#tag EndConstant

	#tag Constant, Name = kLocWaitToDownloadSupportFiles, Type = String, Dynamic = True, Default = \"Wait to download support files...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Espere terminar descarga archivos soporte..."
	#tag EndConstant

	#tag Constant, Name = kLocWaitToDownloadVideos, Type = String, Dynamic = True, Default = \"Wait to download video(s)...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Espere terminar descarga video(s)..."
	#tag EndConstant


#tag EndWindowCode

