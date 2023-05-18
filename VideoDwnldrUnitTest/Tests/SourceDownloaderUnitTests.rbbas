#tag Class
Protected Class SourceDownloaderUnitTests
Inherits TestGroup
	#tag Method, Flags = &h21
		Private Function FindFile(fileName As String, folderName As String = "") As FolderItem
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
		Private Sub MockAssets(assets() As VideoDl.IAsset)
		  Assert.AreEqual 1, CType(assets.Ubound, Integer), "AreEqual 1, CType(assets.Ubound, Integer)"
		  
		  Dim asset As VideoDl.IAsset= assets(0)
		  Dim json As JSONData= asset.Info
		  
		  Assert.IsNotNil json, "IsNotNil json"
		  Assert.IsTrue json.HasName("id"), "IsTrue json.HasName(""id"")"
		  Assert.AreEqual "01", json.Value("id").StringValue, "AreEqual ""01"", json.Value(""id"").StringValue"
		  
		  mFile= asset.File
		  Assert.IsNotNil mFile, "IsNotNil file"
		  
		  mFile.SetProgressAction WeakAddressOf MockProgress
		  mFile.SetCompletedAction WeakAddressOf MockCompleted
		  mFile.Start
		End Sub
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

	#tag Method, Flags = &h0
		Sub SourceMockDownloaderTest()
		  Dim file As FolderItem= FindFile("cacert-2022-07-19.pem", "ca-cert")
		  
		  Dim json As New JSONData
		  json.Value("id")= "01"
		  json.Value("name")= file.Name
		  json.Value("size")= Str(file.Length)
		  
		  mSource= New MockSource
		  MockSource(mSource).AddAsset json, file
		  MockSource(mSource).AddAsset json, file
		  
		  mSource.SetAssetsAction WeakAddressOf MockAssets
		  mSource.Start
		  
		  Assert.Message "ini"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mFile As VideoDl.IFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSource As VideoDl.ISource
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
