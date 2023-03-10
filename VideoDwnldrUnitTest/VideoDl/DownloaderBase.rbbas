#tag Class
Protected Class DownloaderBase
	#tag Method, Flags = &h0
		Sub RaiseCompleted()
		  RaiseEvent Completed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RaiseProgress(bytesTotal As Int64, bytesNow As Int64)
		  RaiseEvent Progress(bytesTotal, bytesNow)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Completed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(bytesTotal As Int64, bytesNow As Int64)
	#tag EndHook


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
