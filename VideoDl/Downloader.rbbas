#tag Class
Protected Class Downloader
Implements IDownloader
	#tag Method, Flags = &h0
		Sub Asset(completed As VideoDl.ActionCompleted, progress As VideoDl.ActionProgress, Assigns file As VideoDl.IFile)
		  If file Is Nil Then Return
		  If mFiles.IndexOf(file)= -1 Then mFiles.Append(file)
		  
		  file.SetCompletedAction completed
		  file.SetProgressAction progress
		  file.Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAssets(action As VideoDl.ActionAssets)
		  If mSource Is Nil Then Return
		  
		  mSource.SetAssetsAction action
		  mSource.Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Source(Assigns source As VideoDl.ISource)
		  mSource= source
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFiles() As VideoDl.IFile
	#tag EndProperty

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
