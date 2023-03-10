#tag Class
Protected Class FileDownloaderFFmpeg
Inherits VideoDl.FileDownloader
	#tag Event
		Sub Completed(fileTemp As FolderItem)
		  If mFolderToCopy Is Nil Then Return
		  
		  Try
		    Dim files() As FolderItem= PKZip.ReadZip(fileTemp, mFolderToCopy)
		    
		    For i As Integer= 0 To files.Ubound // rename folder:
		      Dim file As FolderItem= files(i)
		      If file.Directory And file.Name.InStr("ffmpeg-")> 0 Then
		        Dim ffmpegFolder As FolderItem= mFolderToCopy.Child(kFfmpegFolderName)
		        If ffmpegFolder.Exists Then ffmpegFolder.Name= GetName(ffmpegFolder, kFfmpegFolderName)
		        
		        file.Name= kFfmpegFolderName
		        Exit
		      End If
		    Next
		  Catch e As RuntimeException
		    System.DebugLog CurrentMethodName+ " e.Message: "+ e.Message
		  End Try
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(path As String, folderToCopy As FolderItem)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(path)
		  
		  If Not (folderToCopy Is Nil) And folderToCopy.Directory Then mFolderToCopy= folderToCopy
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mFolderToCopy As FolderItem
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
