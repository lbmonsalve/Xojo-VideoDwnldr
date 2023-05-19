#tag Class
Protected Class DownloaderTests
Inherits TestGroup
	#tag Event
		Sub TearDown()
		  mDownloader= Nil
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DownloadCompleted(fileTemp As FolderItem, idx As Integer)
		  Assert.Pass fileTemp.Name+ " completed!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DownloadProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
		  Dim perc As String= " ("+ Str(bytesNow* 100/ bytesTotal, "###")+ "%)"
		  
		  Assert.Message Str(bytesNow)+ "bytes de "+ Str(bytesTotal)+ perc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlerAssets(assets() As VideoDl.IAsset)
		  Assert.AreEqual 2, CType(assets.Ubound, Integer), "AreEqual 2, CType(assets.Ubound, Integer)"
		  
		  Dim asset As VideoDl.IAsset= assets(0)
		  Dim json As JSONData= asset.Info
		  
		  Assert.IsNotNil json, "IsNotNil json"
		  Assert.IsTrue json.HasName("id"), "IsTrue json.HasName(""id"")"
		  Assert.AreEqual "01", json.Value("id").StringValue, "AreEqual ""01"", json.Value(""id"").StringValue"
		  
		  Dim file As VideoDl.IFile= asset.File
		  Assert.IsNotNil file, "IsNotNil file"
		  
		  mDownloader.Asset(WeakAddressOf DownloadCompleted, WeakAddressOf DownloadProgress)= file
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MockTest()
		  Dim file As FolderItem= FileDownloaderTests.FindFile("cacert-2022-07-19.pem", "ca-cert")
		  
		  Dim json As New JSONData
		  json.Value("id")= "01"
		  json.Value("name")= file.Name
		  json.Value("size")= Str(file.Length)
		  
		  Dim source As New MockSource
		  source.AddAsset json, file
		  source.AddAsset json, file
		  source.AddAsset json, file
		  
		  mDownloader= New VideoDl.Downloader
		  mDownloader.Source= source
		  mDownloader.GetAssets WeakAddressOf HandlerAssets
		  
		  Assert.Message "ini"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mDownloader As VideoDl.Downloader
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
