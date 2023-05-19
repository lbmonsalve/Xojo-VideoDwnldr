#tag Class
Protected Class YoutubeFile
Implements IFile
	#tag Method, Flags = &h0
		Sub Close()
		  If mCmd Is Nil Then Return
		  mCmd.Close
		  RemoveHandler mCmd.Completed, WeakAddressOf CmdCompleted
		  RemoveHandler mCmd.DataAvailable, WeakAddressOf CmdDataAvailable
		  mCmd= Nil
		  
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CmdCompleted(o As Shell)
		  If o.ErrorCode<> 0 Then
		    System.DebugLog CurrentMethodName+ " error: "+ Str(o.ErrorCode)
		    
		    'mFileTemp= Nil
		  End If
		  
		  If Not (mActionCompleted Is Nil) Then
		    mActionCompleted.Invoke mFileTemp, mIdx
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CmdDataAvailable(o As Shell)
		  Const kTagDownload= "[download]"
		  Const kTagDownloaded= "has already been downloaded"
		  Const kTagDestination= "Destination:"
		  
		  Dim out As String= o.ReadAll.DefineEncoding(Encodings.UTF8)
		  Dim lines() As String= out.Split(EndOfLine.UNIX)
		  
		  For Each line As String In lines
		    If line.Trim.Len= 0 Then Continue
		    Dim pos As Integer= line.InStr(kTagDownload)
		    If pos= 0 Then Continue
		    Dim posTemp As Integer= line.InStr(kTagDownloaded)
		    If posTemp> 0 Then
		      Dim filePath As String= line.Mid(pos+ 10, posTemp- 11).Trim
		      Dim file As New FolderItem(filePath)
		      'System.DebugLog CurrentMethodName+ " file: ("+ file.DisplayName+ ") "+ kTagDownloaded
		      mFileTemp= file
		      Return
		    End If
		    posTemp= line.InStr(kTagDestination)
		    If posTemp> 0 Then
		      Dim filePath As String= line.Mid(posTemp+ 12).Trim
		      Dim file As New FolderItem(filePath)
		      'System.DebugLog CurrentMethodName+ " file: ("+ file.DisplayName+ ")"
		      mFileTemp= file
		    Else
		      Dim msgs() As String= line.Split(kTagDownload)
		      For Each msg As String In msgs
		        If msg.Trim.Len= 0 Then Continue
		        'System.DebugLog CurrentMethodName+ " msg: "+ msg
		        If Not (mActionProgress Is Nil) Then
		          mActionProgress.Invoke 0, 0, msg, mIdx
		        End If
		      Next
		    End If
		  Next
		  
		  //[3352] DownloadPanel.CmdDataAvailable result: [download] C:\Users\Usuario\DOWNLO~1\16 de septiembre de 2022-7hB9N24nqEU.mp4 has already been downloaded
		  //[2020] [download] C:\Users\Usuario\DOWNLO~1\16 de septiembre de 2022-best-7hB9N24nqEU.mkv has already been downloaded and merged
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(url As String, id As String)
		  mUrl= url
		  mId= id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCompletedAction(action As VideoDl.ActionCompleted)
		  mActionCompleted= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIndex(Assigns idx As Integer)
		  mIdx= idx
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProgressAction(action As VideoDl.ActionProgress)
		  mActionProgress= action
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  Dim yt As FolderItem= VideoDl.Youtube.Executable
		  Dim ff As FolderItem= VideoDl.FFmpeg.Executable.Parent
		  Dim mf As FolderItem= VideoDl.Youtube.MediaFolder
		  
		  Dim fmtOut As String
		  If mId= "worstvideo+worstaudio" Then
		    fmtOut= """"+ mf.ShellPath+ "\%(title)s-worst-%(id)s.%(ext)s"""
		  ElseIf mId= "bestvideo+bestaudio" Then
		    fmtOut= """"+ mf.ShellPath+ "\%(title)s-best-%(id)s.%(ext)s"""
		  Else
		    fmtOut= """"+ mf.ShellPath+ "\%(title)s-%(id)s.%(ext)s"""
		  End If
		  
		  Dim cmdStr As String= yt.ShellPath+ " --verbose --encoding utf-8 -f {ID} --ffmpeg-location {LOC} -o {FMTOUT} {URL}"
		  cmdStr= cmdStr.Replace("{ID}", mId).Replace("{LOC}", ff.ShellPath).Replace("{FMTOUT}", fmtOut)
		  cmdStr= cmdStr.Replace("{URL}", mUrl)
		  System.DebugLog CurrentMethodName+ " cmdStr= "+ cmdStr
		  
		  If mCmd Is Nil Then
		    mCmd= New Shell
		    mCmd.Mode= 1 // async
		    AddHandler mCmd.Completed, WeakAddressOf CmdCompleted
		    AddHandler mCmd.DataAvailable, WeakAddressOf CmdDataAvailable
		  ElseIf mCmd.IsRunning Then
		    System.DebugLog CurrentMethodName+ " mCmd.IsRunning"
		    Return
		  End If
		  
		  mCmd.Execute cmdStr
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mActionCompleted As VideoDl.ActionCompleted
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActionProgress As VideoDl.ActionProgress
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCmd As Shell
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFileTemp As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mId As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUrl As String
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
