#tag Class
Protected Class DownloadercURL
Inherits VideoDl.DownloaderBase
	#tag Event
		Sub Completed()
		  RaiseEvent Completed
		End Sub
	#tag EndEvent

	#tag Event
		Sub Progress(bytesTotal As Int64, bytesNow As Int64)
		  RaiseEvent Progress(bytesTotal, bytesNow)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function ClientProgress(o As libcURL.cURLClient, dlTotal As Int64, dlNow As Int64, ulTotal As Int64, ulNow As Int64) As Boolean
		  RaiseProgress(dlTotal, dlNow)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClientTransferComplete(o As libcURL.cURLClient, BytesRead As Integer, BytesWritten As Integer)
		  RaiseCompleted
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path As String)
		  mClient= New libcURL.cURLClient
		  AddHandler mClient.Progress, WeakAddressOf ClientProgress
		  AddHandler mClient.TransferComplete, WeakAddressOf ClientTransferComplete
		  
		  mTmpFile= GetTemporaryFolderItem
		  mTmpBs= BinaryStream.Create(mTmpFile, True)
		  
		  'mClient.Get path, mTmpBs
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Completed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(bytesTotal As Int64, bytesNow As Int64)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mClient As libcURL.cURLClient
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTmpBs As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTmpFile As FolderItem
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
