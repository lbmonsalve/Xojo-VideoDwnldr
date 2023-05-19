#tag Interface
Protected Interface IDownloader
	#tag Method, Flags = &h0
		Sub Asset(completed As VideoDl.ActionCompleted, progress As VideoDl.ActionProgress, Assigns file As VideoDl.IFile)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAssets(action As VideoDl.ActionAssets)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Source(Assigns source As VideoDl.ISource)
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface
