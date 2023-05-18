#tag Class
Protected Class MockAsset
Implements VideoDl.IAsset
	#tag Method, Flags = &h0
		Sub Constructor(json As JSONData, file As FolderItem)
		  mJson= json
		  mFile= file
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File() As VideoDl.IFile
		  // Parte de la interfaz VideoDl.IAsset.
		  
		  Return New MockFileDownloader(mFile)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Info() As JSONData
		  // Parte de la interfaz VideoDl.IAsset.
		  
		  Return mJson
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mJson As JSONData
	#tag EndProperty


End Class
#tag EndClass
