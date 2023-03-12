#tag Class
Protected Class Manager
	#tag Method, Flags = &h0
		Sub Assets(action As VideoDl.ActionAssets)
		  mSource.GetAssets action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(source As VideoDl.ISource)
		  mSource= source
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSource As VideoDl.ISource
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
