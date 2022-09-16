#tag Window
Begin ContainerControl MainPanel
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
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   False
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
      TabDefinition   =   "Descarga\rHistorial\rConfiguración"
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
         AcceptFocus     =   ""
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Backdrop        =   ""
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   350
         HelpTag         =   ""
         InitialParent   =   "TabPanel1"
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
         Top             =   50
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
		  Dim f As FolderItem= PreferencesFile
		  If Not f.Exists Then CreatePreferencesFile(f)
		  
		  Dim folderYoutubeDl As FolderItem= SpecialFolder.ApplicationData.Child(BrandName).Child(kYoutubedl)
		  If Not folderYoutubeDl.Exists Then folderYoutubeDl.CreateAsFolder
		  
		  Dim folderFfmpeg As FolderItem= SpecialFolder.ApplicationData.Child(BrandName).Child(kFfmeg)
		  If Not folderFfmpeg.Exists Then folderFfmpeg.CreateAsFolder
		  
		  YoutubeDlFile= folderYoutubeDl.Child("youtube-dl.exe")
		  FfmpegFile= folderFfmpeg.Child("ffmpeg.exe")
		  
		  If YoutubeDlFile.Exists And FfmpegFile.Exists Then
		    DownloadPanel1.YoutubeDlFile= YoutubeDlFile
		    DownloadPanel1.FfmpegFile= FfmpegFile
		    TabPanel1.Enabled= True
		  Else // download
		    Break
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CreatePreferencesFile(f As FolderItem)
		  Dim json As New JSONData
		  json.Compact= False
		  
		  json.Value("url_youtube_dl")= "https://www.dropbox.com/s/ibq3eq8cy2hp584/youtube-dl.exe?dl=1"
		  json.Value("url_ffmpeg")= "https://www.dropbox.com/s/ue2z3b7q7372mgs/ffmpeg-win-2.2.2.zip?dl=1"
		  
		  Dim tos As TextOutputStream= TextOutputStream.Create(f)
		  tos.Write json.ToString
		  tos.Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BrandName As String = "VideoDwnldr"
	#tag EndProperty

	#tag Property, Flags = &h0
		FfmpegFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreferencesFile As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPreferencesFile Is Nil Then
			    Dim f As FolderItem
			    Try
			      #pragma BreakOnExceptions Off
			      f= SpecialFolder.ApplicationData.Child(BrandName)
			      #pragma BreakOnExceptions On
			    Catch e As RunTimeException
			      System.DebugLog CurrentMethodName+ " error: "+ e.Message
			    End Try
			    
			    If f Is Nil Then // sanity chk
			      f= SpecialFolder.Temporary.Child(BrandName+ "_Preferences.json")
			    Else
			      If Not f.Exists Then f.CreateAsFolder
			      f= SpecialFolder.ApplicationData.Child(BrandName).Child("Preferences.json")
			    End If
			    
			    mPreferencesFile= f
			  End If
			  
			  Return mPreferencesFile
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPreferencesFile = value
			End Set
		#tag EndSetter
		PreferencesFile As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		YoutubeDlFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = kFfmeg, Type = String, Dynamic = False, Default = \"ffmeg", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kYoutubedl, Type = String, Dynamic = False, Default = \"youtube-dl", Scope = Private
	#tag EndConstant


#tag EndWindowCode

