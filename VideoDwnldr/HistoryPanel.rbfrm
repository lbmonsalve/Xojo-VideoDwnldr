#tag Window
Begin ContainerControl HistoryPanel
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
   Begin Listbox HistoryLbx
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   "*,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   26
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   220
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
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
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   20
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   360
      _ScrollWidth    =   -1
   End
   Begin TextField NameTxf
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   False
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000FF
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   250
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   260
   End
   Begin BevelButton MergeBtn
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "#kLocMerge"
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
      TabIndex        =   2
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
		Event HistoryContextualMenuAction(hitItem As MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MergePressed()
	#tag EndHook


	#tag Constant, Name = kLocInvalidFileName, Type = String, Dynamic = True, Default = \"Invalid file name", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Nombre archivo inv\xC3\xA1lido"
	#tag EndConstant

	#tag Constant, Name = kLocMerge, Type = String, Dynamic = True, Default = \"Merge", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Mezcla"
	#tag EndConstant

	#tag Constant, Name = kLocMergeIsRunning, Type = String, Dynamic = True, Default = \"Merge is running", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Procesando mezcla"
	#tag EndConstant

	#tag Constant, Name = kLocMustBeSelectedTwoFiles, Type = String, Dynamic = True, Default = \"Must be selected two files (Ctrl+Click)", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Debe seleccionar dos archivos (Ctrl+Clic)"
	#tag EndConstant

	#tag Constant, Name = kSep, Type = String, Dynamic = True, Default = \"\\", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"\\"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"/"
		#Tag Instance, Platform = Mac Classic, Language = Default, Definition  = \"/"
	#tag EndConstant


#tag EndWindowCode

#tag Events HistoryLbx
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If column= 0 Then
		    NameTxf.Text= Me.Cell(row, 0)
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row< Me.ListCount Then
		    If Me.Cell(row, 1)= DownloaderPanel.kLocCompleted Then
		      g.ForeColor= &cD9FFD900
		    Else
		      g.ForeColor= &cFFFFCA00
		    End If
		    g.FillRect 0 ,0 ,g.width, g.height
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  If Me.SelCount= 1 Then
		    For i As Integer= 0 To Me.ListCount- 1
		      If Me.Selected(i) Then
		        Dim fileName As String= Me.Cell(i, 0)
		        If fileName.InStr(".m4a")> 0 Then
		          base.Append New MenuItem("To MP3...", "toMp3")
		        End If
		        Return False
		      End If
		    Next
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem Is Nil Then Return False
		  
		  Return HistoryContextualMenuAction(hitItem)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events NameTxf
	#tag Event
		Sub Open()
		  Me.BackColor= Self.BackColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MergeBtn
	#tag Event
		Sub Action()
		  RaiseEvent MergePressed
		End Sub
	#tag EndEvent
#tag EndEvents
