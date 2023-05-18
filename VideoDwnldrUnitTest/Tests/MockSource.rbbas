#tag Class
Protected Class MockSource
Implements VideoDl.ISource
	#tag Method, Flags = &h0
		Sub AddAsset(json As JSONData, file As FolderItem)
		  mJsons.Append json
		  mFiles.Append file
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAssetsAction(action As VideoDl.ActionAssets)
		  // Parte de la interfaz VideoDl.ISource.
		  
		  mActionAssets= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  // Parte de la interfaz VideoDl.ISource.
		  
		  Dim assets() As VideoDl.IAsset
		  
		  // do some:
		  For i As Integer= 0 To mJsons.Ubound
		    assets.Append New MockAsset(mJsons(i), mFiles(i))
		  Next
		  
		  If Not (mActionAssets Is Nil) Then mActionAssets.Invoke assets
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mActionAssets As VideoDl.ActionAssets
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mJsons() As JSONData
	#tag EndProperty


End Class
#tag EndClass
