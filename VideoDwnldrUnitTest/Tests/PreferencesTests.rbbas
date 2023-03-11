#tag Class
Protected Class PreferencesTests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub DefaultTest()
		  Dim preferences As New VideoDl.Preferences
		  Assert.IsNotNil preferences, "IsNotNil preferences"
		  Assert.IsNotNil preferences.File, "IsNotNil preferences.File"
		  Assert.IsTrue preferences.File.Exists, "IsTrue preferences.File.Exists"
		  
		  Dim json As JSONData= preferences.File.OpenAsJSONData
		  Assert.IsTrue json.HasName(VideoDl.Preferences.kUrl_ffmpeg), "IsTrue json.HasName(VideoDl.Preferences.kUrl_ffmpeg)"
		  Assert.IsTrue json.HasName(VideoDl.Preferences.kUrl_youtube_dl), "IsTrue json.HasName(VideoDl.Preferences.kUrl_youtube_dl)"
		  Assert.IsTrue json.HasName(VideoDl.Preferences.kVideos_folder), "IsTrue json.HasName(VideoDl.Preferences.kVideos_folder)"
		  
		  preferences= New VideoDl.Preferences("test", "test.json")
		  Assert.IsNotNil preferences.File, "IsNotNil preferences.File"
		  Assert.IsTrue preferences.File.Exists, "IsTrue preferences.File.Exists"
		  Assert.AreSame "test", preferences.File.Parent.Name, "AreSame ""test"", preferences.File.Parent.Name"
		  Assert.AreSame "test.json", preferences.File.Name, "AreSame ""test.json"", preferences.File.Name"
		  
		  json= preferences.File.OpenAsJSONData
		  Assert.IsTrue json.HasName(VideoDl.Preferences.kUrl_ffmpeg), "IsTrue json.HasName(VideoDl.Preferences.kUrl_ffmpeg)"
		  Assert.IsTrue json.HasName(VideoDl.Preferences.kUrl_youtube_dl), "IsTrue json.HasName(VideoDl.Preferences.kUrl_youtube_dl)"
		  Assert.IsTrue json.HasName(VideoDl.Preferences.kVideos_folder), "IsTrue json.HasName(VideoDl.Preferences.kVideos_folder)"
		  
		  json.Value(VideoDl.Preferences.kUrl_ffmpeg)= "test1"
		  json.Value(VideoDl.Preferences.kUrl_youtube_dl)= "test2"
		  json.Value(VideoDl.Preferences.kVideos_folder)= "test3"
		  json.Save preferences.File
		  
		  preferences= New VideoDl.Preferences("test", "test.json")
		  json= preferences.File.OpenAsJSONData
		  Assert.AreSame "test1", json.Value(VideoDl.Preferences.kUrl_ffmpeg).StringValue, "AreSame ""test1"", json.Value(VideoDl.Preferences.kUrl_ffmpeg).StringValue"
		  Assert.AreSame "test2", json.Value(VideoDl.Preferences.kUrl_youtube_dl).StringValue, "AreSame ""test1"", json.Value(VideoDl.Preferences.kUrl_youtube_dl).StringValue"
		  Assert.AreSame "test3", json.Value(VideoDl.Preferences.kVideos_folder).StringValue, "AreSame ""test1"", json.Value(VideoDl.Preferences.kVideos_folder).StringValue"
		  
		  preferences.Delete
		  Assert.IsFalse preferences.File.Exists, "IsFalse preferences.File.Exists"
		  Assert.IsFalse preferences.File.Parent.Exists, "IsFalse preferences.File.Parent.Exists"
		End Sub
	#tag EndMethod


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
