#tag Module
Protected Module VideoDl
	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionAssets(assets() As VideoDl . IAsset)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionCompleted(fileTemp As FolderItem, idx As Integer)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionProgress(bytesTotal As Uint64, bytesNow As Uint64, msg As String, idx As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function GetFFmpegExecutable() As FolderItem
		  Dim exec As FolderItem
		  Dim pref As New VideoDl.Preferences
		  
		  exec= pref.File.Parent.Child(kFfmpegFolderName).Child(kFFmpegFileName)
		  Try
		    #pragma BreakOnExceptions Off
		    If Not exec.Exists Then
		      exec= pref.File.Parent.Child(kFfmpegFolderName).Child("bin").Child(kFFmpegFileName)
		      If Not exec.Exists Then
		        System.DebugLog CurrentMethodName+ " Not exec.Exists"
		      End If
		    End If
		    #pragma BreakOnExceptions Default
		  Catch exc As RuntimeException
		    System.DebugLog CurrentMethodName+ " exception: "+ exc.Message
		  End Try
		  
		  Return exec
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFormatedSize(value As UInt64) As String
		  Select Case value
		  Case Is< 1000
		    Return Format(value, "##0\B")
		  Case Is< 1000000
		    Return Str(value/ 1000, "##0.0\K")
		  Case Is< 1000000000
		    Return Str(value/ 1000000, "##0.0\M")
		  Case Else
		    Return Str(value/ (1000000* 1000), "###0.0\G")
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetName(folder As FolderItem, baseName As String) As String
		  Static ext As UInt16
		  Dim name As String
		  
		  Do
		    ext= ext+ 1
		    name= baseName+ "."+ Str(ext, "00#")
		  Loop Until Not folder.Child(name).Exists
		  
		  Return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetValidName(value As String) As String
		  Dim result As String= value.Trim
		  
		  #if TargetWin32
		    If result.Right(1)= "." Then result= result.Left(result.Len- 1)
		    
		    Dim inames() As String= Split(kInvalidNames, ",")
		    For i As Integer= 0 To inames.Ubound
		      Dim search As String= inames(i)
		      If result= search Then Return "invalid name ("+ search+ ")"
		    Next
		    
		    For i As Integer= 1 To Len(kInvalidNamechars)
		      Dim ch As String= Mid(kInvalidNamechars, i, 1)
		      result= ReplaceAll(result, ch, "_")
		    Next
		    
		  #else
		    result= result.ReplaceAll("/", "_")
		  #endif
		  
		  Return result.Left(255)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetYoutubeDlExecutable() As FolderItem
		  Dim pref As New VideoDl.Preferences
		  Dim exec As FolderItem= pref.File.Parent.Child(kYoutubeDlFolderName)
		  If Not exec.Exists Then exec.CreateAsFolder
		  
		  exec= exec.Child(kYoutubeDlFileName)
		  Try
		    #pragma BreakOnExceptions Off
		    If Not exec.Exists Then
		      exec= exec.Parent.Child("yt-dlp.exe")
		      If Not exec.Exists Then
		        System.DebugLog CurrentMethodName+ " Not exec.Exists"
		      End If
		    End If
		    #pragma BreakOnExceptions Default
		  Catch exc As RuntimeException
		    System.DebugLog CurrentMethodName+ " exception: "+ exc.Message
		  End Try
		  
		  Return exec
		End Function
	#tag EndMethod


	#tag Constant, Name = kFFmpegFileName, Type = String, Dynamic = False, Default = \"ffmpeg.exe", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kFfmpegFolderName, Type = String, Dynamic = False, Default = \"ffmpeg", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInvalidNamechars, Type = String, Dynamic = False, Default = \"<>:\"/\\|\?*\xEF\xBD\x9C\xEF\xBC\x9E\xE2\x89\xBA\xE2\x88\x97\xE2\x88\xB6\xEF\xBC\x9F \xE2\x88\x95", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kInvalidNames, Type = String, Dynamic = False, Default = \"CON\x2CPRN\x2CAUX\x2CNUL\x2CCOM1\x2CCOM2\x2CCOM3\x2CCOM4\x2CCOM5\x2CCOM5\x2CCOM7\x2CCOM8\x2CCOM9\x2CLPT1\x2CLPT2\x2CLPT3\x2CLPT4\x2CLPT5\x2CLPT6\x2CLPT7\x2CLPT8\x2C LPT9", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kYoutubeDlFileName, Type = String, Dynamic = False, Default = \"yt-dlp.exe", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kYoutubeDlFolderName, Type = String, Dynamic = False, Default = \"youtube-dl", Scope = Public
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
End Module
#tag EndModule
