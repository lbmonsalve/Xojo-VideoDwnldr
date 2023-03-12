#tag Class
Protected Class MockSource
Implements VideoDl.ISource
	#tag Method, Flags = &h0
		Sub GetAssets(action As VideoDl.ActionAssets)
		  // Parte de la interfaz VideoDl.ISource.
		  
		  mActionAssets= action
		  
		  Dim json As New JSONData
		  json.Value("id")= 1
		  json.Value("name")= "name1"
		  
		  Dim file As VideoDl.IFile= New MockFileDownloader(VideoDl.FindFile("cacert-2022-07-19.pem", "ca-cert"))
		  
		  Dim assets() As VideoDl.IAsset
		  assets.Append New MockAsset(json, file)
		  
		  If Not (mActionAssets Is Nil) Then mActionAssets.Invoke(assets)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mActionAssets As VideoDl.ActionAssets
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
