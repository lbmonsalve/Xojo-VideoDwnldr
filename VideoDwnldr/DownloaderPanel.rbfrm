#tag Window
Begin ContainerControl DownloaderPanel
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   400
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
   Width           =   600
   Begin TabPanel MainTabPanel
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "#kLocDownload\r#kLocHistory\r#kLocConfig"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin DownloadPanel DownloadPanel1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   False
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   360
         HelpTag         =   ""
         InitialParent   =   "MainTabPanel"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   40
         UseFocusRing    =   ""
         Visible         =   True
         Width           =   598
      End
      Begin HistoryPanel HistoryPanel1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   360
         HelpTag         =   ""
         InitialParent   =   "MainTabPanel"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   40
         UseFocusRing    =   ""
         Visible         =   True
         Width           =   598
      End
      Begin ConfigPanel ConfigPanel1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   362
         HelpTag         =   ""
         InitialParent   =   "MainTabPanel"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   38
         UseFocusRing    =   ""
         Visible         =   True
         Width           =   598
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim youtubeExec As FolderItem= VideoDl.Youtube.Executable
		  If youtubeExec Is Nil Then
		    DownloadYoutubeDl
		  ElseIf Not youtubeExec.Exists Then
		    DownloadYoutubeDl
		  Else
		    mChkYoutubeDlFile= True
		  End If
		  
		  Dim ffmpegExec As FolderItem= VideoDl.FFmpeg.Executable
		  If ffmpegExec Is Nil Then
		    DownloadFFmpeg
		  ElseIf Not ffmpegExec.Exists Then
		    DownloadFFmpeg
		  Else
		    mChkFFmpegFile= True
		  End If
		  
		  CheckEnableDownloadPanel
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CheckEnableDownloadPanel()
		  If mChkYoutubeDlFile And mChkFFmpegFile Then
		    DownloadPanel1.Enabled= True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertToMp3(params As Dictionary)
		  Dim fromFile As New FolderItem(params.Value("fromFile").StringValue, FolderItem.PathTypeShell)
		  Dim toFile As New FolderItem(params.Value("toFile").StringValue, FolderItem.PathTypeShell)
		  
		  mToMp3= New VideoDl.FFmpeg
		  mToMp3.Add fromFile
		  mToMp3.ToMP3 toFile, _
		  params.Value("tagTitle").StringValue, params.Value("tagArtist").StringValue, _
		  params.Value("tagAlbum").StringValue, params.Value("tagDate").StringValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadFFmpeg()
		  Dim pref As New VideoDl.Preferences
		  Dim ffmpegFolder As FolderItem= pref.File.Parent
		  
		  Dim json As JSONData= pref.File.OpenAsJSONData
		  Dim urlStr As String= json.Value(VideoDl.Preferences.kUrl_ffmpeg).StringValue
		  Dim ffmpegFile As VideoDl.IFile= New VideoDl.FileDownloaderFFmpeg(urlStr, ffmpegFolder)
		  
		  Dim list As Listbox= HistoryPanel1.HistoryLbx
		  list.AddRow DownloadPanel.kLocInit
		  list.RowTag(list.LastIndex)= ffmpegFile
		  ffmpegFile.SetIndex= list.LastIndex
		  
		  ffmpegFile.SetProgressAction WeakAddressOf HandlerProgress
		  ffmpegFile.SetCompletedAction WeakAddressOf HandlerCompleted
		  ffmpegFile.Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadYoutubeDl()
		  Dim pref As New VideoDl.Preferences
		  Dim youtubeDlFolder As FolderItem= pref.File.Parent.Child(VideoDl.kYoutubeDlFolderName)
		  'If Not youtubeDlFolder.Exists Then youtubeDlFolder.CreateAsFolder
		  
		  Dim json As JSONData= pref.File.OpenAsJSONData
		  Dim urlStr As String= json.Value(VideoDl.Preferences.kUrl_youtube_dl).StringValue
		  Dim youtubeFile As VideoDl.IFile= New VideoDl.FileDownloaderYoutubeDl(urlStr, youtubeDlFolder)
		  
		  Dim list As Listbox= HistoryPanel1.HistoryLbx
		  list.AddRow DownloadPanel.kLocInit
		  list.RowTag(list.LastIndex)= youtubeFile
		  youtubeFile.SetIndex= list.LastIndex
		  
		  youtubeFile.SetProgressAction WeakAddressOf HandlerProgress
		  youtubeFile.SetCompletedAction WeakAddressOf HandlerCompleted
		  youtubeFile.Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerAssets(assets() As VideoDl.IAsset)
		  If assets.Ubound= -1 Then
		    MsgBox "error!"
		    DownloadPanel1.CheckBtn.Enabled= True
		    Return
		  End If
		  
		  Dim list As Listbox= DownloadPanel1.FormatsLbx
		  list.DeleteAllRows
		  
		  Const kNone= "none"
		  
		  For Each asset As VideoDl.IAsset In assets
		    Dim json As JSONData= asset.Info
		    Dim formatNote As String= json.Value("format_note").StringValue
		    Dim acodec As String= json.Value("acodec").StringValue
		    Dim vcodec As String= json.Value("vcodec").StringValue
		    
		    If acodec= kNone And vcodec<> kNone Then
		      formatNote= vcodec
		    ElseIf acodec<> kNone And vcodec= kNone Then
		      formatNote= acodec
		    End If
		    
		    list.AddRow json.Value("ext").StringValue, _
		    json.Value("resolution").StringValue, _
		    formatNote, _
		    json.Value("fileSize").StringValue, _
		    json.Value("moreinfo").StringValue
		    list.RowTag(list.LastIndex)= asset
		  Next
		  
		  DownloadPanel1.NameTxf.Text= _
		  mVideoSource.GetFileData.Lookup("title", "").StringValue.GetValidName
		  
		  DownloadPanel1.CheckBtn.Enabled= True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerCompleted(fileTemp As FolderItem, idx As Integer)
		  If fileTemp Is Nil Then
		    MsgBox "Download file error!"
		    Return
		  End If
		  
		  Dim list As Listbox= HistoryPanel1.HistoryLbx
		  list.Cell(idx, 0)= fileTemp.AbsoluteNativePath
		  
		  If list.RowTag(idx) IsA VideoDl.FileDownloaderYoutubeDl Then
		    mChkYoutubeDlFile= True
		    CheckEnableDownloadPanel
		  ElseIf list.RowTag(idx) IsA VideoDl.FileDownloaderFFmpeg Then
		    mChkFFmpegFile= True
		    CheckEnableDownloadPanel
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerDenoCompleted(fileTemp As FolderItem, idx As Integer)
		  If fileTemp Is Nil Then
		    MsgBox kLocDownloadFileError
		    ConfigPanel1.DenoBtn.Enabled= True
		    Return
		  End If
		  
		  System.DebugLog CurrentMethodName+ " ini"
		  ConfigPanel1.DenoBtn.Caption= kLocUnzipping
		  
		  Dim list As Listbox= HistoryPanel1.HistoryLbx
		  list.Cell(idx, 0)= fileTemp.AbsoluteNativePath
		  
		  Try
		    Dim files() As FolderItem= PKZip.ReadZip(fileTemp, SpecialFolder.Temporary, True)
		    
		    For i As Integer= 0 To files.Ubound
		      Dim file As FolderItem= files(i)
		      If file.Name.InStr(kDenoFileName)= 0 Then Continue
		      
		      ConfigPanel1.DenoBtn.Caption= kLocInstalling
		      
		      Dim sh As New Shell
		      sh.Mode= 1
		      AddHandler sh.Completed, WeakAddressOf HandlerDenoRunCompleted
		      sh.Execute "type "+ file.ShellPath
		      
		      System.DebugLog file.ShellPath
		      
		      mDenoStatus= 1
		    Next
		  Catch e As RuntimeException
		    System.DebugLog CurrentMethodName+ " e.Message: "+ e.Message
		  End Try
		  
		  System.DebugLog CurrentMethodName+ " end"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerDenoRunCompleted(o As Shell)
		  System.DebugLog CurrentMethodName+ " resultCode:"+ Str(o.ErrorCode)
		  
		  ConfigPanel1.DenoBtn.Caption= "Chk Deno..."
		  ConfigPanel1.DenoBtn.Enabled= True
		  
		  mDenoStatus= 2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerMergeCompleted(fileTemp As FolderItem, idx As Integer)
		  HistoryPanel1.MergeBtn.Enabled= True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
		  If bytesTotal> 0 Then
		    Dim perc As String= " ("+ Str(bytesNow* 100/ bytesTotal, "###")+ "%)"
		    HistoryPanel1.HistoryLbx.Cell(idx, 1)= Str(bytesNow)+ kLocBytesOf+ Str(bytesTotal)+ perc
		  Else
		    HistoryPanel1.HistoryLbx.Cell(idx, 1)= msg
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mChkFFmpegFile As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChkYoutubeDlFile As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDenoStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mToMp3 As VideoDl.FFmpeg
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoMerge As VideoDl.FFmpeg
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoSource As VideoDl.ISource
	#tag EndProperty


	#tag Constant, Name = kDenoFileName, Type = String, Dynamic = False, Default = \"deno", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"deno.exe"
		#Tag Instance, Platform = Mac Classic, Language = Default, Definition  = \"deno"
		#Tag Instance, Platform = -, Language = Default, Definition  = \"deno"
	#tag EndConstant

	#tag Constant, Name = kLocAparentementeNoEstáInstalado, Type = String, Dynamic = False, Default = \"It doesn\'t appear to be installed; it requires a JS runtime\rlike \"deno\" to download certain media...\r", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Aparentemente no est\xC3\xA1 instalado\x2C necesita un runtime JS\r\ncomo \"\"deno\"\" para bajar ciertos media...\r\n"
	#tag EndConstant

	#tag Constant, Name = kLocBytesOf, Type = String, Dynamic = False, Default = \"bytes de ", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"bytes de "
	#tag EndConstant

	#tag Constant, Name = kLocChangeName, Type = String, Dynamic = True, Default = \"please change name", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"cambie el nombre"
	#tag EndConstant

	#tag Constant, Name = kLocCompleted, Type = String, Dynamic = True, Default = \"Completed!", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Completado!"
	#tag EndConstant

	#tag Constant, Name = kLocConfig, Type = String, Dynamic = True, Default = \"Configuration", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Configuraci\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = kLocDescargarEInstalar, Type = String, Dynamic = False, Default = \"\xC2\xBFDescargar e instalar\?", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"\xC2\xBFDescargar e instalar\?"
	#tag EndConstant

	#tag Constant, Name = kLocDownload, Type = String, Dynamic = True, Default = \"Download", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Descarga"
	#tag EndConstant

	#tag Constant, Name = kLocDownloadAndInstallDeno, Type = String, Dynamic = False, Default = \"Download and install \"Deno\"\?", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"\xC2\xBFDescargar e instalar \"deno\"\?"
	#tag EndConstant

	#tag Constant, Name = kLocDownloadFileError, Type = String, Dynamic = False, Default = \"Download file error!", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Error en archivo descargado!"
	#tag EndConstant

	#tag Constant, Name = kLocDownloading, Type = String, Dynamic = False, Default = \"Downloading...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Descargando..."
	#tag EndConstant

	#tag Constant, Name = kLocFileExits, Type = String, Dynamic = True, Default = \"File exits!", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Archivo existe!"
	#tag EndConstant

	#tag Constant, Name = kLocHistory, Type = String, Dynamic = True, Default = \"History", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Historial"
	#tag EndConstant

	#tag Constant, Name = kLocInstalling, Type = String, Dynamic = False, Default = \"Installing...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Instalando..."
	#tag EndConstant

	#tag Constant, Name = kLocNoDenoUrlTryDeletePreferencesjsonFile, Type = String, Dynamic = False, Default = \"no deno URL\x2C try delete preferences.json file", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"no deno URL\x2C trate borrar archivo preferences.json"
	#tag EndConstant

	#tag Constant, Name = kLocProcessed, Type = String, Dynamic = False, Default = \"Processed!", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Procesado!"
	#tag EndConstant

	#tag Constant, Name = kLocProcessingWaitAndRetry, Type = String, Dynamic = False, Default = \"Processing\x2C wait and re-try!", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Procesando\x2C espere y reintente!"
	#tag EndConstant

	#tag Constant, Name = kLocUnzipping, Type = String, Dynamic = False, Default = \"Unzipping...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Descomprim..."
	#tag EndConstant


#tag EndWindowCode

#tag Events DownloadPanel1
	#tag Event
		Sub CheckPressed()
		  If Me.UrlTxf.Text.Len= 0 Then
		    MsgBox Me.kLocMsgWFAD
		    Me.UrlTxf.SetFocus
		    Return
		  End If
		  
		  Me.CheckBtn.Enabled= False
		  
		  mVideoSource= New VideoDl.Youtube(Me.UrlTxf.Text)
		  mVideoSource.SetAssetsAction WeakAddressOf HandlerAssets
		  mVideoSource.Start
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadPressed()
		  If Me.FormatsLbx.ListCount= 0 Then
		    MsgBox Me.kLocMsgCVRA
		    Return
		  End If
		  
		  Dim asset As VideoDl.IAsset= Me.FormatsLbx.RowTag(Me.FormatsLbx.ListIndex)
		  Dim json As JSONData= asset.Info
		  Dim file As VideoDl.IFile= asset.File
		  
		  Dim list As Listbox= HistoryPanel1.HistoryLbx
		  list.AddRow Me.kLocInit
		  list.RowTag(list.LastIndex)= file
		  file.SetIndex= list.LastIndex
		  
		  file.SetProgressAction WeakAddressOf HandlerProgress
		  file.SetCompletedAction WeakAddressOf HandlerCompleted
		  file.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HistoryPanel1
	#tag Event
		Sub MergePressed()
		  Dim list As Listbox= Me.HistoryLbx
		  
		  If list.ListCount= 0 Then
		    MsgBox Me.kLocMustBeSelectedTwoFiles
		    Return
		  End If
		  
		  Dim inputFiles() As FolderItem
		  For i As Integer= 0 To list.ListCount- 1
		    If list.Selected(i) Then inputFiles.Append(New FolderItem(list.Cell(i, 0)))
		  Next
		  
		  If inputFiles.Ubound<> 1 Then
		    MsgBox Me.kLocMustBeSelectedTwoFiles
		    Return
		  End If
		  
		  Dim outputFile As FolderItem
		  Try
		    outputFile= New FolderItem(Me.NameTxf.Text)
		  Catch exc As RuntimeException
		    MsgBox Me.kLocInvalidFileName
		    Return
		  End Try
		  
		  If outputFile.Exists Then
		    MsgBox kLocFileExits+ EndOfLine+ EndOfLine+ kLocChangeName
		    Me.NameTxf.SetFocus
		    Return
		  End If
		  
		  Me.MergeBtn.Enabled= False
		  
		  mVideoMerge= New VideoDl.FFmpeg
		  For Each file As FolderItem In inputFiles
		    mVideoMerge.Add file
		  Next
		  mVideoMerge.SetCompletedAction WeakAddressOf HandlerMergeCompleted
		  mVideoMerge.Merge outputFile
		End Sub
	#tag EndEvent
	#tag Event
		Function HistoryContextualMenuAction(hitItem As MenuItem) As Boolean
		  If hitItem.Tag= "toMp3" Then
		    Dim list As Listbox= Me.HistoryLbx
		    
		    For i As Integer= 0 To list.ListCount- 1
		      If list.Selected(i) Then
		        Dim pathfile As String= list.Cell(i, 0)
		        Dim namefile As String= pathfile.GetFileNameFromPath
		        Dim folder As String= pathfile.GetFullPath
		        Dim name As String= folder+ nameFile.GetValidName
		        
		        Mp3Window.Mp3Panel1.NameTxf.HelpTag= list.Cell(i, 0)
		        Mp3Window.Mp3Panel1.NameTxf.Text= name.Replace(".m4a", ".mp3")
		        Mp3Window.Show
		        Return False
		      End If
		    Next
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ConfigPanel1
	#tag Event
		Sub Open()
		  Dim pref As New VideoDl.Preferences
		  Dim json As JSONData= pref.File.OpenAsJSONData
		  
		  Dim names() As String= json.Names
		  For Each name As String In names
		    Me.PropsLbx.AddRow name, json.Value(name).StringValue
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub SavePressed()
		  Dim pref As New VideoDl.Preferences
		  Dim json As JSONData= pref.File.OpenAsJSONData
		  Dim changed As Boolean
		  
		  For i As Integer= 0 To Me.PropsLbx.ListCount- 1
		    Dim name As String= Me.PropsLbx.Cell(i, 0)
		    Dim value As String= Me.PropsLbx.Cell(i, 1)
		    If json.HasName(name) Then
		      If json.Value(name).StringValue<> value Then
		        json.Value(name)= value
		        changed= True
		      End If
		    Else
		      json.Value(name)= value
		      changed= True
		    End If
		  Next
		  
		  If changed Then json.Save pref.File
		End Sub
	#tag EndEvent
	#tag Event
		Sub DenoPressed()
		  // run deno --version
		  Dim denoVersion As String
		  
		  Dim sh As New Shell
		  sh.TimeOut= 5000
		  sh.Execute "deno --version"
		  denoVersion= sh.Result.Trim
		  
		  If denoVersion.InStr("""deno""")= 0 Then
		    MsgBox denoVersion
		    Return
		  End If
		  
		  If mDenoStatus= 1 Then
		    MsgBox kLocProcessingWaitAndRetry
		    Return
		  ElseIf mDenoStatus= 2 Then
		    MsgBox kLocProcessed
		    Return
		  End If
		  
		  Dim dlg As New MessageDialog
		  dlg.Icon= MessageDialog.GraphicQuestion
		  dlg.ActionButton.Caption= kLocDescargarEInstalar
		  dlg.CancelButton.Visible= True
		  dlg.Message= kLocDownloadAndInstallDeno
		  dlg.Explanation= kLocAparentementeNoEstáInstalado
		  
		  Dim dlgBtn As MessageDialogButton= dlg.ShowModal
		  
		  If dlgBtn= dlg.CancelButton Then Return
		  
		  Me.DenoBtn.Enabled= False
		  Me.DenoBtn.Caption= kLocDownloading
		  
		  Dim pref As New VideoDl.Preferences
		  Dim json As JSONData= pref.File.OpenAsJSONData
		  Dim urlStr As String= json.Lookup(VideoDl.Preferences.kUrl_deno, "").StringValue
		  If urlStr= "" Then
		    MsgBox kLocNoDenoUrlTryDeletePreferencesjsonFile
		    Return
		  End If
		  
		  Dim denoFile As VideoDl.IFile= New VideoDl.FileDownloader(urlStr)
		  
		  Dim list As Listbox= HistoryPanel1.HistoryLbx
		  list.AddRow DownloadPanel.kLocInit
		  list.RowTag(list.LastIndex)= denoFile
		  denoFile.SetIndex= list.LastIndex
		  
		  denoFile.SetProgressAction WeakAddressOf HandlerProgress
		  denoFile.SetCompletedAction WeakAddressOf HandlerDenoCompleted
		  denoFile.Start
		End Sub
	#tag EndEvent
#tag EndEvents
