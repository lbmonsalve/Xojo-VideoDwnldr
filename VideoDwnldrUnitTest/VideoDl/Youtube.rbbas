#tag Class
Protected Class Youtube
Implements ISource
	#tag Method, Flags = &h0
		Sub Constructor(url As String)
		  mUrl= url
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAssets(action As VideoDl.ActionAssets)
		  mActionAssets= action
		  
		  Dim assets() As VideoDl.IAsset
		  
		  If Not (mActionAssets Is Nil) Then mActionAssets.Invoke(assets)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersionExecutable() As String
		  If Executable Is Nil Then Return ""
		  If mVersionExecutable.Len> 0 Then Return mVersionExecutable
		  
		  Dim sh As New Shell
		  sh.TimeOut= 3000
		  sh.Execute Executable.ShellPath+ " --version"
		  mVersionExecutable= sh.Result.Trim
		  
		  Return mVersionExecutable
		End Function
	#tag EndMethod


	#tag Note, Name = Readme
		
		version: 2023.02.21.334
		
		
		commands:
		--version
		--verbose -F {URL}
		--verbose --encoding utf-8 -f {ID} --ffmpeg-location {LOC} -o {FMTOUT} {URL}
		
		https://youtu.be/AA9Ybq5in-c
		https://www.youtube.com/watch?v=Xa2oMHABr7k
		https://www.youtube.com/watch?v=Do2A5ZZrUNs
	#tag EndNote


	#tag Property, Flags = &h0
		Shared Executable As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActionAssets As VideoDl.ActionAssets
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUrl As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVersionExecutable As String
	#tag EndProperty


	#tag Constant, Name = VersionExpected, Type = String, Dynamic = False, Default = \"2021.12.17", Scope = Public
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
