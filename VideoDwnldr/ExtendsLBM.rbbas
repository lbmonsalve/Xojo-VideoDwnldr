#tag Module
Protected Module ExtendsLBM
	#tag Method, Flags = &h0
		Function AbsoluteNativePath(Extends ff As FolderItem) As String
		  #If RBVersion< 2013
		    Return ff.AbsolutePath
		  #else
		    Return ff.NativePath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AreSameAs(Extends values() As String, toCompare() As String, threshold As Double = 0.8) As Boolean
		  Dim nValues As Integer= values.Ubound
		  Dim nToCompare As Integer= toCompare.Ubound
		  Dim counter As Integer
		  
		  For i As Integer= 0 To nValues
		    If i> nToCompare Then Exit
		    
		    If values(i)= toCompare(i) Then counter= counter+ 1
		  Next
		  
		  Dim rate As Double= counter/ (nValues+ 1)
		  
		  Return rate>= threshold
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFileNameFromPath(Extends path As String) As String
		  If path.Len= 0 Then Return ""
		  
		  #if TargetWin32
		    Const kSep= "\"
		  #else
		    Const kSep= "/"
		  #endif
		  
		  Dim parts() As String= Split(path, kSep)
		  
		  If parts.LastIdx> -1 Then Return parts(parts.LastIdx)
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFullPath(Extends path As String) As String
		  If path.Len= 0 Then Return ""
		  
		  #if TargetWin32
		    Const kSep= "\"
		  #else
		    Const kSep= "/"
		  #endif
		  
		  Dim parts() As String= Split(path, kSep)
		  
		  If parts.LastIdx= -1 Then Return ""
		  If parts.LastIdx> 0 Then parts.Remove(parts.LastIdx)
		  
		  Return Join(parts, kSep)+ kSep
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetValidName(Extends value As String) As String
		  Dim result As String= value.Trim
		  
		  #if TargetWin32
		    If result.Right(1)= "." Then result= result.Left(result.Len- 1)
		    
		    'Dim inames() As String= Split(kInvalidNames, ",")
		    'For i As Integer= 0 To inames.Ubound
		    'Dim search As String= inames(i)
		    'If result= search Then Return "invalid name ("+ search+ ")"
		    'Next
		    
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

	#tag Method, Flags = &h0
		Function LastIdx(Extends values() As String) As Integer
		  #If RBVersion< 2013.21
		    Return values.Ubound
		  #else
		    Return values.LastIndex
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenAsJSONData(Extends ff As FolderItem) As JSONData
		  Dim tis As TextInputStream= TextInputStream.Open(ff)
		  Dim ret As New JSONData(tis.ReadAll)
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(Extends json As JSONData, ff As FolderItem)
		  If ff Is Nil Then Return
		  If ff.Directory Then Return
		  
		  json.Compact= False
		  
		  Dim tos As TextOutputStream= TextOutputStream.Create(ff)
		  tos.Write json.ToString
		  tos.Close
		End Sub
	#tag EndMethod


	#tag Constant, Name = kInvalidNamechars, Type = String, Dynamic = False, Default = \"<>:\"/\\|\?*\xEF\xBD\x9C\xEF\xBC\x9E\xE2\x89\xBA\xE2\x88\x97\xE2\x88\xB6\xEF\xBC\x9F\xE2\x88\x95", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kInvalidNames, Type = String, Dynamic = False, Default = \"CON\x2CPRN\x2CAUX\x2CNUL\x2CCOM1\x2CCOM2\x2CCOM3\x2CCOM4\x2CCOM5\x2CCOM5\x2CCOM7\x2CCOM8\x2CCOM9\x2CLPT1\x2CLPT2\x2CLPT3\x2CLPT4\x2CLPT5\x2CLPT6\x2CLPT7\x2CLPT8\x2C LPT9", Scope = Private
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
