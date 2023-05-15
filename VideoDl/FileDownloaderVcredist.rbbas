#tag Class
Protected Class FileDownloaderVcredist
Inherits VideoDl.FileDownloader
	#tag Event
		Sub Completed(fileTemp As FolderItem)
		  If FolderToCopy Is Nil Then Return
		  
		  Try
		    Call PKZip.ReadZip(fileTemp, FolderToCopy)
		  Catch e As RuntimeException
		    System.DebugLog CurrentMethodName+ " e.Message: "+ e.Message
		  End Try
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="Idx"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="VideoDl.FileDownloader"
		#tag EndViewProperty
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
