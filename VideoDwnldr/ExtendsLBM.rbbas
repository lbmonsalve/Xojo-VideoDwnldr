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
