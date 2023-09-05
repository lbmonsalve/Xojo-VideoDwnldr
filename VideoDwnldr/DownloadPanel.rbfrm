#tag Window
Begin ContainerControl DownloadPanel
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
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
   Width           =   400
   Begin BevelButton CheckBtn
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Check"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   30
      HelpTag         =   ""
      Icon            =   ""
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   320
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   60
   End
   Begin TextField UrlTxf
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   "#kLocURL"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   20
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   288
   End
   Begin Listbox FormatsLbx
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   "10%,15%,75%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   26
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   2
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   170
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#kLocType	#kLocResolution	#kLocNote"
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   70
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   360
      _ScrollWidth    =   -1
   End
   Begin BevelButton DownloadBtn
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "#DownloaderPanel.kLocDownload"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   30
      HelpTag         =   ""
      Icon            =   ""
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   290
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   250
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   90
   End
End
#tag EndWindow

#tag WindowCode
	#tag Hook, Flags = &h0
		Event CheckPressed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadPressed()
	#tag EndHook


	#tag Constant, Name = kLocAvailableQuality, Type = String, Dynamic = True, Default = \"AvailableQuality", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"DisponibleCalidad"
	#tag EndConstant

	#tag Constant, Name = kLocBestQuality, Type = String, Dynamic = True, Default = \"BestQuality", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"MejorCalidad"
	#tag EndConstant

	#tag Constant, Name = kLocInit, Type = String, Dynamic = True, Default = \"Init...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Iniciando..."
	#tag EndConstant

	#tag Constant, Name = kLocMsgCVRA, Type = String, Dynamic = True, Default = \"Check video resolutions available", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Chequee resoluciones de video disponibles"
	#tag EndConstant

	#tag Constant, Name = kLocMsgSRD, Type = String, Dynamic = True, Default = \"Select download resolution", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Seleccione resolucion a descarga"
	#tag EndConstant

	#tag Constant, Name = kLocMsgWFAD, Type = String, Dynamic = True, Default = \"Write file address to download", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Escriba direcci\xC3\xB3n del archivo a descargar"
	#tag EndConstant

	#tag Constant, Name = kLocNote, Type = String, Dynamic = True, Default = \"Note", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Nota"
	#tag EndConstant

	#tag Constant, Name = kLocResolution, Type = String, Dynamic = True, Default = \"Resolution", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Resoluci\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = kLocType, Type = String, Dynamic = True, Default = \"Type", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Tipo"
	#tag EndConstant

	#tag Constant, Name = kLocUrl, Type = String, Dynamic = True, Default = \"URL / web address", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Direcci\xC3\xB3n web / URL"
	#tag EndConstant

	#tag Constant, Name = kLocWorstQuality, Type = String, Dynamic = True, Default = \"WorstQuality", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"MenorCalidad"
	#tag EndConstant


#tag EndWindowCode

#tag Events CheckBtn
	#tag Event
		Sub Action()
		  RaiseEvent CheckPressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DownloadBtn
	#tag Event
		Sub Action()
		  RaiseEvent DownloadPressed
		End Sub
	#tag EndEvent
#tag EndEvents
