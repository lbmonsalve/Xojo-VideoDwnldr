#tag Class
Protected Class App
Inherits Application
	#tag Constant, Name = kEdit, Type = String, Dynamic = True, Default = \"&Edit", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"&Edici\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = True, Default = \"C&lear", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"&Borrar"
	#tag EndConstant

	#tag Constant, Name = kEditCopy, Type = String, Dynamic = True, Default = \"&Copy", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"&Copiar"
	#tag EndConstant

	#tag Constant, Name = kEditCut, Type = String, Dynamic = True, Default = \"Cu&t", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Cor&tar"
	#tag EndConstant

	#tag Constant, Name = kEditPaste, Type = String, Dynamic = True, Default = \"&Paste", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"&Pegar"
	#tag EndConstant

	#tag Constant, Name = kEditSelectAll, Type = String, Dynamic = True, Default = \"Sellect &all", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Seleccion&ar Todo"
	#tag EndConstant

	#tag Constant, Name = kEditUndo, Type = String, Dynamic = True, Default = \"&Undo", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Des&hacer"
	#tag EndConstant

	#tag Constant, Name = kFile, Type = String, Dynamic = True, Default = \"&File", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"&Archivo"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = True, Default = \"Quit", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Salir"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = -, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kHelp, Type = String, Dynamic = True, Default = \"Help", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Ayuda"
	#tag EndConstant

	#tag Constant, Name = kHelpAbout, Type = String, Dynamic = True, Default = \"About...", Scope = Public
		#Tag Instance, Platform = Cualquiera, Language = es, Definition  = \"Acerca de..."
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
