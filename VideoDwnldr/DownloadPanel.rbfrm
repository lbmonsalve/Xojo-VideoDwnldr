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
   Begin TextField TextField1
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
   Begin Listbox Listbox1
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
      ScrollbarHorizontal=   ""
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
   Begin BevelButton BevelButton2
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "#MainPanel.kLocDownload"
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
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   -30
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -30
      Width           =   32
   End
   Begin ComboBox ComboBox1
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "#kLocAvailableQuality\r\n#kLocWorstQuality\r\n#kLocBestQuality"
      Italic          =   ""
      Left            =   20
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   250
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   258
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub CmdCompleted(o As Cmd)
		  If o.Idx= -1 Then Return
		  
		  PanelHistory.Listbox1.Cell(o.Idx, 1)= MainPanel.kLocCompleted
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CmdDataAvailable(o As Cmd)
		  If o.Idx= -1 Then Return
		  
		  // TODO: linux, mac encodings
		  Dim result As String= ReplaceLineEndings(ConvertEncoding(o.ReadAll.DefineEncoding(Encodings.WindowsANSI), Encodings.UTF8), EndOfLine.Windows)
		  Dim results() As String= result.Split(EndOfLine.Windows)
		  
		  While results(0).Len= 0
		    results.Remove 0
		  Wend
		  
		  Dim data As String= results(0)
		  Dim pos As Integer
		  
		  //[3352] DownloadPanel.CmdDataAvailable result: [download] C:\Users\Usuario\DOWNLO~1\16 de septiembre de 2022-7hB9N24nqEU.mp4 has already been downloaded
		  //[2020] [download] C:\Users\Usuario\DOWNLO~1\16 de septiembre de 2022-best-7hB9N24nqEU.mkv has already been downloaded and merged
		  
		  // already downloaded:
		  pos= data.InStr("has already been downloaded")
		  If pos> 0 Then
		    data= data.Mid(12, pos- 12).Trim
		    PanelHistory.Listbox1.Cell(o.Idx, 0)= data
		    'System.DebugLog CurrentMethodName+ " data: ("+ data+ ")"
		    Return
		  End If
		  
		  // destination
		  pos= data.InStr("estination:")
		  If pos> 0 Then
		    data= data.Mid(pos+ 12).Trim
		    Try
		      Dim file As New FolderItem(data)
		      PanelHistory.Listbox1.Cell(o.Idx, 0)= file.DisplayName
		    Catch e As RuntimeException
		      System.DebugLog CurrentMethodName+ " e.Message: "+ e.Message
		    End Try
		    Return
		  End If
		  
		  // downloading:
		  pos= data.InStr("[download]")
		  If pos> 0 Then
		    data= data.Mid(pos+ 10).Trim
		    PanelHistory.Listbox1.Cell(o.Idx, 1)= data
		    'System.DebugLog CurrentMethodName+ " data: ("+ data+ ")"
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Cmds() As Cmd
	#tag EndProperty

	#tag Property, Flags = &h0
		FfmpegFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		PanelHistory As HistoryPanel
	#tag EndProperty

	#tag Property, Flags = &h0
		PanelMain As MainPanel
	#tag EndProperty

	#tag Property, Flags = &h0
		VideosFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		YoutubeDlFile As FolderItem
	#tag EndProperty


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

#tag Events BevelButton1
	#tag Event
		Sub Action()
		  If TextField1.Text= "" Then
		    MsgBox kLocMsgWFAD
		    TextField1.SetFocus
		    Return
		  End If
		  
		  Dim cmd As String= YoutubeDlFile.ShellPath+ " -F "+ TextField1.Text
		  
		  Dim ss As New Shell
		  ss.TimeOut= 10000
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
		  ElseIf ss.ErrorCode< -1 Then // download vcredist:
		    If Not PanelMain.DownloadVcredist Then
		      MsgBox "error! code:"+Str( ss.ErrorCode)
		    End If
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
		    MsgBox kLocMsgCVRA
		    Return
		  End If
		  
		  Dim fmtSel, fmtOut As String
		  
		  If ComboBox1.Text= kLocAvailableQuality Then
		    If Listbox1.ListIndex= -1 Then
		      MsgBox kLocMsgSRD
		      Return
		    End If
		    fmtSel= Listbox1.RowTag(Listbox1.ListIndex).StringValue
		    fmtOut= """"+ VideosFolder.ShellPath+ "\%(title)s-%(id)s.%(ext)s"""
		  ElseIf ComboBox1.Text= kLocWorstQuality Then
		    fmtSel= "worstvideo+worstaudio"
		    fmtOut= """"+ VideosFolder.ShellPath+ "\%(title)s-worst-%(id)s.%(ext)s"""
		  ElseIf ComboBox1.Text= kLocBestQuality Then
		    fmtSel= "bestvideo+bestaudio"
		    fmtOut= """"+ VideosFolder.ShellPath+ "\%(title)s-best-%(id)s.%(ext)s"""
		  End If
		  
		  PanelHistory.Listbox1.AddRow kLocInit
		  Dim idx As Integer= PanelHistory.Listbox1.LastIndex
		  PanelHistory.Listbox1.RowTag(idx)= VideosFolder
		  
		  Dim cmd As String= YoutubeDlFile.ShellPath+ _
		  " -f "+ fmtSel+ _
		  " --ffmpeg-location "+ FfmpegFile.ShellPath+ _
		  " -o "+ fmtOut+ _
		  " "+ TextField1.Text
		  
		  Dim ss As New Cmd
		  AddHandler ss.DataAvailable, WeakAddressOf CmdDataAvailable
		  AddHandler ss.Completed, WeakAddressOf CmdCompleted
		  ss.Mode= 1 // Async
		  ss.Idx= idx
		  ss.Execute cmd
		  
		  Cmds.Append ss
		  
		  If Timer1.Mode= Timer.ModeOff Then
		    Timer1.Mode= Timer1.ModeMultiple
		    Timer1.Enabled= True
		  End If
		  
		  PanelMain.TabPanel1.Value= 1
		  
		  System.DebugLog CurrentMethodName+ " "+ cmd
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  Dim idxs() As Integer
		  
		  For i As Integer= 0 To Cmds.Ubound
		    Dim ss As Cmd= Cmds(i)
		    If Not ss.IsRunning Then
		      RemoveHandler ss.DataAvailable, WeakAddressOf CmdDataAvailable
		      RemoveHandler ss.Completed, WeakAddressOf CmdCompleted
		      idxs.Append i
		    End If
		    If ss.ErrorCode<> 0 Then
		      System.DebugLog CurrentMethodName+ " ss.ErrorCode: "+ Str(ss.ErrorCode)
		    End If
		  Next
		  
		  For Each idx As Integer In idxs
		    Cmds.Remove idx
		    'System.DebugLog CurrentMethodName+ " Cmds.Remove "+ Str(idx)
		  Next
		  
		  If Cmds.Ubound= -1 Then
		    Me.Mode= Timer.ModeOff
		    'System.DebugLog CurrentMethodName+ " Me.Mode= Timer.ModeOff"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
