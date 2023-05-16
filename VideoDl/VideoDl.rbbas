#tag Module
Protected Module VideoDl
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionAssets(assets() As VideoDl . IAsset)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionCompleted(fileTemp As FolderItem, idx As Integer)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function GetFFmpegExecutable() As FolderItem
		  Dim exec As FolderItem
		  Dim pref As New VideoDl.Preferences
		  
		  exec= pref.File.Parent.Child(kFfmpegFolderName).Child(kFFmpegFileName)
		  Try
		    #pragma BreakOnExceptions Off
		    If Not exec.Exists Then
		      exec= pref.File.Parent.Child(kFfmpegFolderName).Child("bin").Child(kFFmpegFileName)
		      If Not exec.Exists Then
		        System.DebugLog CurrentMethodName+ " Not exec.Exists"
		      End If
		    End If
		    #pragma BreakOnExceptions Default
		  Catch exc As RuntimeException
		    System.DebugLog CurrentMethodName+ " exception: "+ exc.Message
		  End Try
		  
		  Return exec
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetName(folder As FolderItem, baseName As String) As String
		  Static ext As UInt16
		  Dim name As String
		  
		  Do
		    ext= ext+ 1
		    name= baseName+ "."+ Str(ext, "00#")
		  Loop Until Not folder.Child(name).Exists
		  
		  Return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetYoutubeDlExecutable() As FolderItem
		  Dim pref As New VideoDl.Preferences
		  Dim exec As FolderItem= pref.File.Parent.Child(kYoutubeDlFolderName)
		  If Not exec.Exists Then exec.CreateAsFolder
		  
		  exec= exec.Child(kYoutubeDlFileName)
		  Try
		    #pragma BreakOnExceptions Off
		    If Not exec.Exists Then
		      exec= exec.Parent.Child("yt-dlp.exe")
		      If Not exec.Exists Then
		        System.DebugLog CurrentMethodName+ " Not exec.Exists"
		      End If
		    End If
		    #pragma BreakOnExceptions Default
		  Catch exc As RuntimeException
		    System.DebugLog CurrentMethodName+ " exception: "+ exc.Message
		  End Try
		  
		  Return exec
		End Function
	#tag EndMethod


	#tag Constant, Name = kFFmpegFileName, Type = String, Dynamic = False, Default = \"ffmpeg.exe", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFfmpegFolderName, Type = String, Dynamic = False, Default = \"ffmpeg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kYoutubeDlFileName, Type = String, Dynamic = False, Default = \"youtube-dl.exe", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kYoutubeDlFolderName, Type = String, Dynamic = False, Default = \"youtube-dl", Scope = Public
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
End Module
#tag EndModule
