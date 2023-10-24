#tag Window
Begin Window Mp3Window
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Mp3"
   Visible         =   True
   Width           =   400
   Begin Mp3Panel Mp3Panel1
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
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   400
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events Mp3Panel1
	#tag Event
		Sub SavePressed()
		  Dim params As New Dictionary
		  params.Value("fromFile")= Me.NameTxf.HelpTag
		  params.Value("tagTitle")= Me.TagsLbx.Cell(0, 1)
		  params.Value("tagArtist")= Me.TagsLbx.Cell(1, 1)
		  params.Value("tagAlbum")= Me.TagsLbx.Cell(2, 1)
		  params.Value("tagDate")= Me.TagsLbx.Cell(3, 1)
		  params.Value("toFile")= Me.NameTxf.Text
		  
		  Window1.DownloaderPanel1.ConvertToMp3 params
		  
		  Me.Window.Hide
		End Sub
	#tag EndEvent
#tag EndEvents
