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
		    MsgBox kWaitToDownloadSupportFiles
		    Return True
		  End If
		  
		  If MainPanel1.DownloadPanel1.Cmds.Ubound> -1 Then
		    MsgBox kWaitToDownloadVideos
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Constant, Name = kWaitToDownloadSupportFiles, Type = String, Dynamic = True, Default = \"Wait to download support files...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Espere terminar descarga archivos soporte..."
	#tag EndConstant

	#tag Constant, Name = kWaitToDownloadVideos, Type = String, Dynamic = True, Default = \"Wait to download video(s)...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Espere terminar descarga video(s)..."
	#tag EndConstant


#tag EndWindowCode

