#tag Class
Protected Class Preferences
	#tag Method, Flags = &h0
		Sub Constructor(folderName As String = "VideoDwnldr", fileName As String = "Preferences.json")
		  mFolderName= folderName
		  mFileName= fileName
		  
		  Dim file As FolderItem= Self.File
		  If Not file.Exists Then CreatePreferencesFile(file)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreatePreferencesFile(f As FolderItem)
		  Dim json As New JSONData
		  json.Compact= False
		  
		  json.Value(kUrl_youtube_dl)= kUrl_youtube_dl_value
		  json.Value(kUrl_ffmpeg)= kUrl_ffmpeg_value
		  json.Value(kVideos_folder)= SpecialFolder.Movies.AbsoluteNativePath
		  
		  json.Save f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete(folder As Boolean = True, file As Boolean = True)
		  If file Then Self.File.Delete
		  If folder Then Self.File.Parent.Delete
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPreferencesFile Is Nil Then
			    Dim f As FolderItem
			    Try
			      #pragma BreakOnExceptions Off
			      f= SpecialFolder.ApplicationData.Child(mFolderName)
			      #pragma BreakOnExceptions On
			    Catch e As RunTimeException
			      System.DebugLog CurrentMethodName+ " error: "+ e.Message
			    End Try
			    
			    If f Is Nil Then // sanity chk
			      f= SpecialFolder.Temporary.Child(mFolderName+ "_"+ mFileName)
			    Else
			      If Not f.Exists Then f.CreateAsFolder
			      f= SpecialFolder.ApplicationData.Child(mFolderName).Child(mFileName)
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
		File As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mFileName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFolderName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreferencesFile As FolderItem
	#tag EndProperty


	#tag Constant, Name = kUrl_ffmpeg, Type = String, Dynamic = False, Default = \"url_ffmpeg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUrl_ffmpeg_value, Type = String, Dynamic = True, Default = \"https://www.dropbox.com/s/ue2z3b7q7372mgs/ffmpeg-win-2.2.2.zip\?dl\x3D1", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"https://www.dropbox.com/s/ue2z3b7q7372mgs/ffmpeg-win-2.2.2.zip\?dl\x3D1"
	#tag EndConstant

	#tag Constant, Name = kUrl_youtube_dl, Type = String, Dynamic = False, Default = \"url_youtube_dl", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUrl_youtube_dl_value, Type = String, Dynamic = True, Default = \"https://www.dropbox.com/s/ibq3eq8cy2hp584/youtube-dl.exe\?dl\x3D1", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"https://www.dropbox.com/s/ibq3eq8cy2hp584/youtube-dl.exe\?dl\x3D1"
	#tag EndConstant

	#tag Constant, Name = kVideos_folder, Type = String, Dynamic = False, Default = \"videos_folder", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
