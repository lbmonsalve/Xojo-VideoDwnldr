#tag Class
Protected Class Cmd
Inherits Shell
	#tag Property, Flags = &h0
		Idx As Integer = -1
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Arguments"
			Visible=true
			EditorType="String"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backend"
			Visible=true
			EditorType="String"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Idx"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Visible=true
			EditorType="Integer"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeOut"
			Visible=true
			EditorType="Integer"
			InheritedFrom="Shell"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InheritedFrom="Shell"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
