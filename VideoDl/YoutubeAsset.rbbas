#tag Class
Protected Class YoutubeAsset
Implements IAsset
	#tag Method, Flags = &h0
		Sub Constructor(jInfo As JSONData)
		  mInfo= jInfo
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File() As VideoDl.IFile
		  Return New VideoDl.YoutubeFile(mInfo.Value("url").StringValue, mInfo.Value("id").StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Info() As JSONData
		  Return mInfo
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mInfo As JSONData
	#tag EndProperty


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
