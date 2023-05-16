#tag Class
Protected Class FileDownloader
Implements IFile
	#tag Method, Flags = &h21
		Private Sub ClientError(o As libcURL.cURLClient, errorCode As Integer)
		  mErrorCode= errorCode
		  
		  RaiseEvent Error(errorCode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ClientProgress(o As libcURL.cURLClient, dlTotal As Int64, dlNow As Int64, ulTotal As Int64, ulNow As Int64) As Boolean
		  If dlTotal<= 0 Then Return False
		  
		  Static bytesNow As Uint64
		  If bytesNow= dlNow Then
		    Return False
		  Else
		    bytesNow= dlNow
		  End If
		  
		  RaiseEvent Progress(dlTotal, dlNow)
		  
		  If Not (mActionProgress Is Nil) Then mActionProgress.Invoke(dlTotal, dlNow, "", Idx)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClientTransferComplete(o As libcURL.cURLClient, BytesRead As Integer, BytesWritten As Integer)
		  RaiseEvent Completed(mTmpFile)
		  
		  If Not (mActionCompleted Is Nil) Then mActionCompleted.Invoke(mTmpFile, Idx)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Close()
		  mClient.Abort
		  
		  RemoveHandler mClient.Progress, WeakAddressOf ClientProgress
		  RemoveHandler mClient.TransferComplete, WeakAddressOf ClientTransferComplete
		  RemoveHandler mClient.Error, WeakAddressOf ClientError
		  
		  mClient= Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path As String)
		  mClient= New libcURL.cURLClient
		  AddHandler mClient.Progress, WeakAddressOf ClientProgress
		  AddHandler mClient.TransferComplete, WeakAddressOf ClientTransferComplete
		  AddHandler mClient.Error, WeakAddressOf ClientError
		  
		  mTmpFile= GetTemporaryFolderItem
		  mTmpBs= BinaryStream.Create(mTmpFile, True)
		  mPath= path
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(path As String, folderToCopy As FolderItem)
		  Constructor(path)
		  
		  If Not (folderToCopy Is Nil) And folderToCopy.Directory Then mFolderToCopy= folderToCopy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Close
		  
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderToCopy() As FolderItem
		  Return mFolderToCopy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCompletedAction(action As VideoDl.ActionCompleted)
		  mActionCompleted= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProgressAction(action As VideoDl.ActionProgress)
		  mActionProgress= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  mClient.Get mPath, mTmpBs
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TransferComplete() As Boolean
		  If mClient Is Nil Then Return False
		  
		  Return mClient.IsTransferComplete
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Completed(ByRef fileTemp As FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(errorCode As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(bytesTotal As Int64, bytesNow As Int64)
	#tag EndHook


	#tag Property, Flags = &h0
		Idx As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActionCompleted As VideoDl.ActionCompleted
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActionProgress As VideoDl.ActionProgress
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mClient As libcURL.cURLClient
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFolderToCopy As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTmpBs As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTmpFile As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Idx"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
