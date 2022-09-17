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
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
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
      SelectionType   =   0
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
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &h000000FF
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   256
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   360
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If column= 0 Then
		    Label1.Text= Me.Cell(row, 0)
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Label1
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If Me.Text.Len> 0 Then Return True Else Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If Not (x< 0 Or y< 0 Or x> Me.Width Or y> Me.Height) Then
		    If Listbox1.ListIndex<> -1 Then
		      Dim folder As FolderItem= Listbox1.RowTag(Listbox1.ListIndex)
		      If folder.Directory Then folder.Launch
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
