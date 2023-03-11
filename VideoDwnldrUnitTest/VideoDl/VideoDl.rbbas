#tag Module
Protected Module VideoDl
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionAssets(assets() As VideoDl.IAsset)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionCompleted(fileTemp As FolderItem)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String)
	#tag EndDelegateDeclaration

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


	#tag Constant, Name = kFfmpegFolderName, Type = String, Dynamic = False, Default = \"ffmpeg", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kYoutubeDlFileName, Type = String, Dynamic = False, Default = \"youtube-dl.exe", Scope = Private
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
