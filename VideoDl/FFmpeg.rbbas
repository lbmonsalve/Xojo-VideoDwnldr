#tag Class
Protected Class FFmpeg
	#tag Method, Flags = &h0
		Sub Add(file As FolderItem)
		  mFiles.Append file
		End Sub
	#tag EndMethod

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
		  If o.ErrorCode<> 0 Then
		    System.DebugLog CurrentMethodName+ " error: "+ Str(o.ErrorCode)
		  End If
		  
		  If Not (mActionCompleted Is Nil) Then
		    mActionCompleted.Invoke mFileTemp, Idx
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Merge(tofile As FolderItem)
		  Dim inputStr As String
		  For Each file As FolderItem In mFiles
		    inputStr= inputStr+ "-i """+ file.ShellPath+ """ "
		  Next
		  If inputStr.Len= 0 Then Return
		  
		  Dim cmdStr As String= Executable.ShellPath+ " {INPUT} -c copy ""{OUTPUT}"" "
		  cmdStr= cmdStr.Replace("{INPUT}", inputStr).Replace("{OUTPUT}", tofile.ShellPath)
		  System.DebugLog CurrentMethodName+ " "+ cmdStr
		  
		  If mCmd Is Nil Then
		    mCmd= New Shell
		    mCmd.Mode= 1 // async
		    AddHandler mCmd.Completed, WeakAddressOf CmdCompleted
		  ElseIf mCmd.IsRunning Then
		    System.DebugLog CurrentMethodName+ " mCmd.IsRunning"
		    Return
		  End If
		  
		  mFileTemp= toFile
		  mCmd.Execute cmdStr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCompletedAction(action As VideoDl.ActionCompleted)
		  mActionCompleted= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToMP3(tofile As FolderItem, title As String, artist As String, album As String, date As String)
		  Dim inputStr As String
		  For Each file As FolderItem In mFiles
		    inputStr= inputStr+ "-i """+ file.ShellPath+ """ "
		  Next
		  If inputStr.Len= 0 Then Return
		  
		  Dim cmdStr As String= kCmdToMp3.Replace("{EXE}", Executable.ShellPath)
		  cmdStr= cmdStr.Replace("{INPUT}", inputStr).Replace("{OUTPUT}", tofile.ShellPath)
		  cmdStr= cmdStr.Replace("%t", title).Replace("%a", artist).Replace("%al", album).Replace("%d", date)
		  System.DebugLog CurrentMethodName+ " "+ cmdStr
		  
		  If mCmd Is Nil Then
		    mCmd= New Shell
		    mCmd.Mode= 1 // async
		    AddHandler mCmd.Completed, WeakAddressOf CmdCompleted
		  ElseIf mCmd.IsRunning Then
		    System.DebugLog CurrentMethodName+ " mCmd.IsRunning"
		    Return
		  End If
		  
		  mFileTemp= toFile
		  mCmd.Execute cmdStr
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mExecutable Is Nil Then mExecutable= GetFFmpegExecutable
			  
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

	#tag Property, Flags = &h0
		Idx As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActionCompleted As VideoDl.ActionCompleted
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCmd As Shell
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mExecutable As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFileTemp As FolderItem
	#tag EndProperty


	#tag Constant, Name = kCmdToMp3, Type = String, Dynamic = False, Default = \"{EXE} {INPUT} -metadata title\x3D\"%t\" -metadata artist\x3D\"%a\" -metadata album\x3D\"%al\" -metadata date\x3D\"%d\" -qscale:a 9 \"{OUTPUT}\" ", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Idx"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
