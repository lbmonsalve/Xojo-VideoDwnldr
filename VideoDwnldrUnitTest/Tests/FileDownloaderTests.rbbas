#tag Class
Protected Class FileDownloaderTests
Inherits TestGroup
	#tag Event
		Sub TearDown()
		  ReDim mDownloadFiles(-1)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub FileMockTest()
		  Dim file As FolderItem= FindFile("cacert-2022-07-19.pem", "ca-cert")
		  
		  Dim mockFile As VideoDl.IFile= New MockFileDownloader(file)
		  mockFile.SetProgressAction WeakAddressOf MockProgress
		  mockFile.SetCompletedAction WeakAddressOf MockCompleted
		  mockFile.Start
		  mDownloadFiles.Append mockFile
		  
		  Assert.Message "ini"
		  'AsyncAwait 20
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FindFile(fileName As String, folderName As String = "") As FolderItem
		  Dim parent As FolderItem = app.ExecutableFile.Parent
		  
		  While parent<>Nil
		    
		    Dim file As FolderItem
		    If folderName= "" Then
		      file = parent.Child(fileName)
		    Else
		      file = parent.Child(folderName).Child(fileName)
		    End If
		    
		    If file<>Nil And file.Exists Then
		      Return file
		    End If
		    
		    parent = parent.Parent
		  Wend
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MockCompleted(fileTemp As FolderItem, idx As Integer)
		  Assert.Pass fileTemp.Name+ " completed!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MockProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
		  Dim perc As String= " ("+ Str(bytesNow* 100/ bytesTotal, "###")+ "%)"
		  
		  Assert.Message Str(bytesNow)+ "bytes de "+ Str(bytesTotal)+ perc
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mDownloadFiles() As VideoDl.IFile
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="TestGroup"
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
			Name="NotImplementedCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="TestGroup"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="TestGroup"
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
