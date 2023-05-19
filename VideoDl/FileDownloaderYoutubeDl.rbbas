#tag Class
Protected Class FileDownloaderYoutubeDl
Inherits VideoDl.FileDownloader
	#tag Event
		Sub Completed(ByRef fileTemp As FolderItem)
		  If FolderToCopy Is Nil Then Return
		  If Not FolderToCopy.Exists Then FolderToCopy.CreateAsFolder
		  
		  Dim fileNew As FolderItem= FolderToCopy.Child(kYoutubeDlFileName)
		  fileTemp.CopyFileTo fileNew
		  fileTemp= fileNew
		  
		End Sub
	#tag EndEvent


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
