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
   Begin TextField TextField1
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
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "#kMerge"
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
	#tag Method, Flags = &h21
		Private Sub CmdCompleted(o As Shell)
		  System.DebugLog CurrentMethodName+ " "+ o.Result
		  BevelButton1.Enabled= True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindFile(name As String) As FolderItem
		  Dim folder As FolderItem= PanelMain.DownloadPanel1.VideosFolder
		  
		  If name.InStr(kSep)> 0 Then
		    Dim fNames() As String= name.Split(kSep)
		    name= fNames(fNames.Ubound)
		  End If
		  Dim nameWords() As String= name.Split(" ")
		  
		  For i As Integer= 1 To folder.Count
		    Dim file As FolderItem= folder.Item(i)
		    If file.Directory Then Continue
		    
		    Dim fileName As String= file.Name
		    Dim fileNameWords() As String= fileName.Split(" ")
		    If nameWords.AreSameAs(fileNameWords) Then Return file
		  Next
		  
		  Return folder
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCmd As Shell
	#tag EndProperty

	#tag Property, Flags = &h0
		PanelMain As MainPanel
	#tag EndProperty


	#tag Constant, Name = kMerge, Type = String, Dynamic = True, Default = \"Merge", Scope = Private
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Mezcla"
	#tag EndConstant

	#tag Constant, Name = kMergeIsRunning, Type = String, Dynamic = True, Default = \"Merge is running", Scope = Private
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Procesando mezcla"
	#tag EndConstant

	#tag Constant, Name = kMustBeSelectedTwoFiles, Type = String, Dynamic = True, Default = \"Must be selected two files (Shift+Click)", Scope = Private
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Debe seleccionar dos archivos (Shift+Clic)"
	#tag EndConstant

	#tag Constant, Name = kSep, Type = String, Dynamic = True, Default = \"\\", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"\\"
		#Tag Instance, Platform = -, Language = Default, Definition  = \"/"
		#Tag Instance, Platform = Mac Classic, Language = Default, Definition  = \"/"
	#tag EndConstant


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If column= 0 Then
		    TextField1.Text= Me.Cell(row, 0)
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If Listbox1.ListIndex<> -1 Then
		    Dim folder As FolderItem= Listbox1.RowTag(Listbox1.ListIndex)
		    If folder.Directory Then folder.Launch
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row< Me.ListCount Then
		    If Me.Cell(row, 1)= MainPanel.kLocCompleted Then
		      g.ForeColor= &cD9FFD900
		    Else
		      g.ForeColor= &cFFFFCA00
		    End If
		    g.FillRect 0 ,0 ,g.width, g.height
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events TextField1
	#tag Event
		Sub Open()
		  Me.BackColor= Self.BackColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton1
	#tag Event
		Sub Action()
		  If Listbox1.ListCount= 0 Then
		    MsgBox kMustBeSelectedTwoFiles
		    Return
		  End If
		  
		  Dim inputFileNames() As String
		  For i As Integer= 0 To Listbox1.ListCount- 1
		    If Listbox1.Selected(i) Then inputFileNames.Append Listbox1.Cell(i, 0).DefineEncoding(Encodings.WindowsANSI)
		  Next
		  
		  If inputFileNames.Ubound<> 1 Then
		    MsgBox kMustBeSelectedTwoFiles
		    Return
		  End If
		  
		  Dim cmd As String= PanelMain.FfmpegFile.ShellPath +" "
		  Dim file As FolderItem
		  For Each name As String In inputFileNames
		    file= FindFile(name)
		    cmd= cmd+ "-i """+ file.ShellPath+ """ "
		  Next
		  file= PanelMain.DownloadPanel1.VideosFolder.Child(TextField1.Text.Trim)
		  cmd= cmd+ "-c copy """+ file.ShellPath+ """"
		  
		  System.DebugLog CurrentMethodName+ " "+ cmd
		  Me.Enabled= False
		  
		  If mCmd Is Nil Then
		    mCmd= New Shell
		    AddHandler mCmd.Completed, WeakAddressOf CmdCompleted
		  End If
		  If mCmd.IsRunning Then
		    MsgBox kMergeIsRunning
		    Return
		  End If
		  
		  mCmd.Execute cmd
		End Sub
	#tag EndEvent
#tag EndEvents
