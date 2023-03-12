#tag Class
Protected Class MockAsset
Implements VideoDl.IAsset
	#tag Method, Flags = &h0
		Sub Constructor(json As JSONData, file As VideoDl.IFile)
		  mJson= json
		  mFile= file
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File() As VideoDl.IFile
		  // Parte de la interfaz VideoDl.IAsset.
		  
		  Return mFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Info() As JSONData
		  // Parte de la interfaz VideoDl.IAsset.
		  
		  Return mJson
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFile As VideoDl.IFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mJson As JSONData
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
