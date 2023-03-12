#tag Class
Protected Class SourceUnitTests
Inherits TestGroup
	#tag Method, Flags = &h21
		Private Sub MockAssets(assets() As VideoDl.IAsset)
		  Assert.AreEqual 1, assets.Count, "AreEqual 1, assets.Count"
		  
		  Dim asset As VideoDl.IAsset= assets(0)
		  
		  Dim json As JSONData= asset.Info
		  Assert.IsNotNil json, "IsNotNil json"
		  Assert.AreEqual 1, json.Value("id").IntegerValue, "AreSame 1, json.Value(""id"").IntegerValue"
		  Assert.AreSame "name1", json.Value("name").StringValue, "AreSame ""name1"", json.Value(""name"").StringValue"
		  
		  Dim file As VideoDl.IFile= asset.File
		  file.GetFile WeakAddressOf MockCompleted
		  mDownloadFiles.Append file
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MockCompleted(fileTemp As FolderItem)
		  Assert.Pass fileTemp.Name+ " completed!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MockYoutubeTest()
		  Dim source As VideoDl.ISource= New MockSource
		  source.GetAssets WeakAddressOf MockAssets
		  mSources.Append source
		  
		  Assert.Message "ini"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mDownloadFiles() As VideoDl.IFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSources() As VideoDl.ISource
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
