#tag Class
Protected Class MockFileDownloader
Implements VideoDl.IFileDownloader
	#tag Method, Flags = &h0
		Sub Constructor(file As FolderItem)
		  mFile= file
		  
		  mProcess= New Timer
		  mProcess.Period= 1
		  mProcess.Enabled= False
		  mProcess.Mode= Timer.ModeOff
		  AddHandler mProcess.Action, WeakAddressOf HandlerProcessAction
		  
		  mRnd= New Random
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  mProcess.Mode= Timer.ModeOff
		  RemoveHandler mProcess.Action, WeakAddressOf HandlerProcessAction
		  
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerProcessAction(o As Timer)
		  If mFile Is Nil Then
		    o.Mode= Timer.ModeOff
		    Return
		  End If
		  
		  Dim bytesTotal As Uint64= mFile.Length
		  Dim bytesNow As UInt64
		  
		  For i As Integer= 1 To 10
		    // fake work:
		    Dim waitTicks As Integer= Ticks+ mRnd.InRange(1, 20)
		    While waitTicks> Ticks
		    Wend
		    // fake work:
		    
		    bytesNow= (i* bytesTotal)/ 10
		    If Not (mActionProgress Is Nil) Then mActionProgress.Invoke(bytesTotal, bytesNow)
		    System.DebugLog Str(waitTicks)
		  Next
		  
		  If Not (mActionCompleted Is Nil) Then mActionCompleted.Invoke(mFile)
		  System.DebugLog "completed!"
		  
		  o.Mode= Timer.ModeOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCompletedAction(action As VideoDl.ActionCompleted)
		  // Parte de la interfaz VideoDl.IFileDownloader.
		  
		  mActionCompleted= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProgressAction(action As VideoDl.ActionProgress)
		  // Parte de la interfaz VideoDl.IFileDownloader.
		  
		  mActionProgress= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  // Parte de la interfaz VideoDl.IFileDownloader.
		  
		  mProcess.Mode= Timer.ModeSingle
		  mProcess.Enabled= True
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mActionCompleted As VideoDl.ActionCompleted
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActionProgress As VideoDl.ActionProgress
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mProcess As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRnd As Random
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
