#tag Window
Begin ContainerControl ConfigPanel
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
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   ""
      ColumnWidths    =   "20%,80%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   26
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   220
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#kLocProp	#kLocValue"
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   20
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   360
      _ScrollWidth    =   -1
   End
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "#kLocSave"
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
      TabIndex        =   1
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
	#tag Property, Flags = &h0
		PreferencesFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = kLocProp, Type = String, Dynamic = True, Default = \"Prop", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocSave, Type = String, Dynamic = True, Default = \"Save", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Grabar"
	#tag EndConstant

	#tag Constant, Name = kLocValue, Type = String, Dynamic = True, Default = \"Value", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Valor"
	#tag EndConstant


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Sub Open()
		  Me.ColumnType(1)= Listbox.TypeEditable
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton1
	#tag Event
		Sub Action()
		  Dim json As JSONData= PreferencesFile.OpenAsJSONData
		  Dim changed As Boolean
		  
		  For i As Integer= 0 To Listbox1.ListCount- 1
		    Dim name As String= Listbox1.Cell(i, 0)
		    Dim value As String= Listbox1.Cell(i, 1)
		    If json.HasName(name) Then
		      If json.Value(name)<> value Then
		        json.Value(name)= value
		        changed= True
		      End If
		    Else
		      json.Value(name)= value
		      changed= True
		    End If
		  Next
		  
		  If changed Then json.Save PreferencesFile
		End Sub
	#tag EndEvent
#tag EndEvents
