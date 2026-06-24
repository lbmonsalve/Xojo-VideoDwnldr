#tag Class
Protected Class Youtube
Implements ISource
	#tag Method, Flags = &h0
		Sub Close()
		  If mCmd Is Nil Then Return
		  mCmd.Close
		  RemoveHandler mCmd.Completed, WeakAddressOf CmdCompleted
		  mCmd= Nil
		  
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CmdCompleted(o As Shell)
		  Dim assets() As VideoDl.IAsset
		  
		  If o.ErrorCode<> 0 Then
		    System.DebugLog CurrentMethodName+ " error: "+ Str(o.ErrorCode)
		    mActionAssets.Invoke assets
		    Return
		  End If
		  
		  Dim out As String= o.ReadAll.DefineEncoding(Encodings.UTF8)
		  Dim json1 As New JSONData(out.Mid(out.InStr("{")))
		  Dim formats As JSONData= json1.Value("formats")
		  If formats Is Nil Or Not (formats.IsArray) Then
		    System.DebugLog CurrentMethodName+ " formats Is Nil Or Not (formats.IsArray)"
		    Return
		  End If
		  
		  Const kNone= "none"
		  
		  For i As Integer= 0 To formats.Count- 1
		    Dim format As JSONData= formats.Child(i)
		    Dim elem As New JSONData
		    
		    elem.Value("url")= mUrl
		    elem.Value("id")= format.Lookup("format_id", kNone).StringValue
		    elem.Value("ext")= format.Lookup("ext", kNone).StringValue
		    elem.Value("resolution")= format.Lookup("resolution", kNone).StringValue
		    elem.Value("fps")= format.Lookup("fps", kNone).StringValue
		    elem.Value("channels")= format.Lookup("audio_channels", kNone).StringValue
		    elem.Value("fileSize")= format.Lookup("fileSize", kNone).StringValue
		    elem.Value("bitrate")= format.Lookup("tbr", kNone).StringValue
		    elem.Value("protocol")= format.Lookup("protocol", kNone).StringValue
		    elem.Value("vcodec")= format.Lookup("vcodec", kNone).StringValue
		    elem.Value("acodec")= format.Lookup("acodec", kNone).StringValue
		    elem.Value("moreinfo")= format.Lookup("format", kNone).StringValue
		    
		    assets.append New VideoDl.YoutubeAsset(elem)
		  Next
		  
		  mActionAssets.Invoke assets
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url As String)
		  mUrl= url
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAssetsAction(action As VideoDl.ActionAssets)
		  mActionAssets= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  If mActionAssets Is Nil Then
		    System.DebugLog CurrentMethodName+ " mActionAssets Is Nil"
		    Return
		  End If
		  
		  If mCmd Is Nil Then
		    mCmd= New Shell
		    mCmd.Mode= 1 // async
		    AddHandler mCmd.Completed, WeakAddressOf CmdCompleted
		  ElseIf mCmd.IsRunning Then
		    System.DebugLog CurrentMethodName+ " mCmd.IsRunning"
		    Return
		  End If
		  
		  mCmd.Execute Executable.ShellPath+ " -F -j "+ mUrl
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function VersionExecutable() As String
		  If Executable Is Nil Then Return ""
		  If mVersionExecutable.Len> 0 Then Return mVersionExecutable
		  
		  Dim sh As New Shell
		  sh.TimeOut= 5000
		  sh.Execute Executable.ShellPath+ " --version"
		  mVersionExecutable= sh.Result.Trim
		  
		  Return mVersionExecutable
		End Function
	#tag EndMethod


	#tag Note, Name = Readme
		
		Example:
		
		``` vb
		mVideoSource= New VideoDl.Youtube("https://youtu.be/AA9Ybq5in-c")
		mVideoSource.SetAssetsAction WeakAddressOf HandlerAssets
		mVideoSource.Start
		```
		
		``` vb
		Private Sub HandlerAssets(assets() As VideoDl.IAsset)
		  mVideoAssets= assets
		End Sub
		```
		
		``` vb
		  Dim asset As VideoDl.IAsset= mVideoAssets(11)
		  mVideoFile= asset.File
		  mVideoFile.SetProgressAction WeakAddressOf DownloadProgress
		  mVideoFile.SetCompletedAction WeakAddressOf DownloadCompleted
		  mVideoFile.Start
		```
		
		``` vb
		Private Sub DownloadProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
		  If bytesTotal> 0 Then
		    Dim perc As String= " ("+ Str(bytesNow* 100/ bytesTotal, "###")+ "%)"
		    System.DebugLog Str(bytesNow)+ "bytes de "+ Str(bytesTotal)+ perc
		  Else
		    System.DebugLog CurrentMethodName+ " msg: "+ msg
		  End If
		End Sub
		```
		
		``` vb
		Private Sub DownloadCompleted(fileTemp As FolderItem, idx As Integer)
		  System.DebugLog fileTemp.Name+ " completed!"
		End Sub
		```
		
		see UnitTestWindow.PushButton1.Action
		
		
		
		
		yt-dlp version: 2023.02.21.334
		
		commands:
		--version
		--verbose -F {URL}
		--verbose --encoding utf-8 -f {ID} --ffmpeg-location {LOC} -o {FMTOUT} {URL}
		
		https://youtu.be/AA9Ybq5in-c
		https://www.youtube.com/watch?v=Xa2oMHABr7k
		https://www.youtube.com/watch?v=Do2A5ZZrUNs
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mExecutable Is Nil Then mExecutable= GetYoutubeDlExecutable
			  
			  return mExecutable
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mExecutable = value
			End Set
		#tag EndSetter
		Shared Executable As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mActionAssets As VideoDl.ActionAssets
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCmd As Shell
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If  mMediaFolder Is Nil Then
			    Dim pref As New VideoDl.Preferences
			    Dim json As JSONData= pref.File.OpenAsJSONData
			    mMediaFolder= New FolderItem(json.Value(VideoDl.Preferences.kVideos_folder).StringValue, FolderItem.PathTypeShell)
			  End If
			  
			  return mMediaFolder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMediaFolder = value
			End Set
		#tag EndSetter
		Shared MediaFolder As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mExecutable As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mMediaFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUrl As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mVersionExecutable As String
	#tag EndProperty


	#tag Constant, Name = VersionExpected, Type = String, Dynamic = False, Default = \"2023.02.21.334", Scope = Public
	#tag EndConstant


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
