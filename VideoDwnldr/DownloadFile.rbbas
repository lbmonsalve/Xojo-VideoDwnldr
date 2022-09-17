#tag Class
Protected Class DownloadFile
Inherits libcURL.cURLClient
	#tag Property, Flags = &h0
		FinalFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Idx As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		IsRunning As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TmpBs As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h0
		TmpFile As FolderItem
	#tag EndProperty


	#tag ViewBehavior
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
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsSSLCertOK"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libcURL.cURLManager"
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
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libcURL.cURLManager"
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
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libcURL.cURLManager"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Yield"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="libcURL.cURLManager"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
