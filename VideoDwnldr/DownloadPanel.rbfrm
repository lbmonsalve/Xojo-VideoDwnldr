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
   Begin BevelButton BevelButton1
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
      TabIndex        =   0
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
   Begin TextField TextField1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   30
      HelpTag         =   "URL/dirección web"
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
      TabIndex        =   1
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
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   ""
      ColumnWidths    =   "10%,15%,75%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   169
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Resolution	Note"
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   69
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   360
      _ScrollWidth    =   -1
   End
   Begin BevelButton BevelButton2
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Descargar"
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
      TabIndex        =   3
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
		FfmpegFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		YoutubeDlFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events BevelButton1
	#tag Event
		Sub Action()
		  If TextField1.Text= "" Then
		    MsgBox "Escriba dirección del archivo a descargar"
		    TextField1.SetFocus
		    Return
		  End If
		  
		  Dim cmd As String= YoutubeDlFile.ShellPath+ " -F "+ TextField1.Text
		  
		  Dim ss As New Shell
		  ss.TimeOut= 5000
		  ss.Execute cmd
		  
		  If ss.ErrorCode= 0 Then
		    Dim result As String= ReplaceLineEndings(ConvertEncoding(ss.Result, Encodings.UTF8), EndOfLine.Windows)
		    Dim results() As String= result.Split(EndOfLine.Windows)
		    
		    Do
		      results.Remove 0
		    Loop Until results(0).Left(6)= "format"
		    results.Remove 0
		    If results(results.Ubound).Trim= "" Then results.Remove(results.Ubound)
		    
		    Listbox1.DeleteAllRows
		    
		    For Each line As String In results
		      Dim code As String= line.Mid(1, 13).Trim
		      Dim exte As String= line.Mid(14, 11).Trim
		      Dim reso As String= line.Mid(25, 11).Trim
		      Dim note As String= line.Mid(36).Trim
		      
		      Listbox1.AddRow exte, reso, note
		      Listbox1.RowTag(Listbox1.LastIndex)= code
		    Next
		  Else
		    MsgBox "error! code:"+Str( ss.ErrorCode)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton2
	#tag Event
		Sub Action()
		  If Listbox1.ListCount= 0 Then
		    MsgBox "cheqee resoluciones de video disponibles"
		    Return
		  End If
		  
		  If Listbox1.ListIndex= -1 Then
		    MsgBox "Seleccione resolucion a descargar"
		    Return
		  End If
		  
		  MsgBox "format: "+ Listbox1.RowTag(Listbox1.ListIndex).StringValue
		End Sub
	#tag EndEvent
#tag EndEvents
