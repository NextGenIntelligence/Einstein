/*	Native global functions.*/DefConst('kIOTypes,	{		iostring: true,		iobinary: true	});DefConst('kNativeLibrary_Call, func(libref, numArgs, spec, args)	begin		local theRef := call NSRuntime.NativeCalls_PrepareFFIStructure with			(libref, spec.name, numArgs);				if (theRef = -1) then			Throw('|evt.ex.msg|, "Error with Call (" &				call NSRuntime.NativeCalls_GetErrorMessage with ()				& ")");				try			// Set the args.			foreach argIndex, argType in spec.args do			begin				call NSRuntime.NativeCalls_SetArgValueAndType with					(theRef, argIndex, args[argIndex], argType);			end;			// Set the result type.			local theResultType := spec.result;			call NSRuntime.NativeCalls_SetResultType with (theRef, theResultType);						// Call the function.			local theResult := call NSRuntime.NativeCalls_Call with (theRef, theResultType);				// Grab some ioargs.			foreach argIndex, argType in spec.args do			begin				if (kIOTypes.(argType)) then					call NSRuntime.NativeCalls_GetOutArgValue with						(theRef, argIndex, args[argIndex], argType);			end;		onexception |evt.ex| do			begin				// Free the structure.				call NSRuntime.NativeCalls_DisposeFFIStructure with (theRef);				Rethrow();			end;		// Free the structure.		call NSRuntime.NativeCalls_DisposeFFIStructure with (theRef);				return theResult;	end);DefConst('kNativeLibrary_GetFunction, func(spec)	begin		local nbArgs := Length(spec.args);		local libRef := self._ref;		if (nbArgs = 0) then			func()				call kNativeLibrary_Call with (libRef, 0, spec, [])		else if (nbArgs = 1) then			func(arg1)				call kNativeLibrary_Call with (libRef, 1, spec, [arg1])		else if (nbArgs = 2) then			func(arg1, arg2)				call kNativeLibrary_Call with (libRef, 2, spec, [arg1, arg2])		else if (nbArgs = 3) then			func(arg1, arg2, arg3)				call kNativeLibrary_Call with (libRef, 3, spec, [arg1, arg2, arg3])		else if (nbArgs = 4) then			func(arg1, arg2, arg3, arg4)				call kNativeLibrary_Call with (libRef, 4, spec, [arg1, arg2, arg3, arg4])		else if (nbArgs = 5) then			func(arg1, arg2, arg3, arg4, arg5)				call kNativeLibrary_Call					with (libRef, 5, spec, [arg1, arg2, arg3, arg4, arg5])		else if (nbArgs = 6) then			func(arg1, arg2, arg3, arg4, arg5, arg6)				call kNativeLibrary_Call					with (libRef, 6, spec, [arg1, arg2, arg3, arg4, arg5, arg6])		else if (nbArgs = 7) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7)				call kNativeLibrary_Call					with (libRef, 7, spec, [arg1, arg2, arg3, arg4, arg5, arg6, arg7])		else if (nbArgs = 8) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)				call kNativeLibrary_Call					with (libRef, 8, spec, [arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8])		else if (nbArgs = 9) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)				call kNativeLibrary_Call					with (libRef, 9, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9])		else if (nbArgs = 10) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)				call kNativeLibrary_Call					with (libRef, 10, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10])		else if (nbArgs = 11) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)				call kNativeLibrary_Call					with (libRef, 11, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11])		else if (nbArgs = 12) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)				call kNativeLibrary_Call					with (libRef, 12, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12])		else if (nbArgs = 13) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,				arg13)				call kNativeLibrary_Call					with (libRef, 13, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,						arg13])		else if (nbArgs = 14) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,				arg13, arg14)				call kNativeLibrary_Call					with (libRef, 14, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,						arg13, arg14])		else if (nbArgs = 15) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,				arg13, arg14, arg15)				call kNativeLibrary_Call					with (libRef, 15, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,						arg13, arg14, arg15])		else if (nbArgs = 16) then			func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,				arg13, arg14, arg15, arg16)				call kNativeLibrary_Call					with (libRef, 16, spec,						[arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12,						arg13, arg14, arg15, arg16])		else			Throw('|evt.ex.msg|, "Too many arguments");	end);DefConst('kNativeLibrary_Close, func()	begin		call NSRuntime.NativeCalls_CloseLib with (self._ref);	end);DefConst('kOpenNativeLibraryFn, func(path)	begin		local theRef := call NSRuntime.NativeCalls_OpenLib with (path);		if (theRef = -1) then			Throw('|evt.ex.msg|, "Error with OpenLib (" &				call NSRuntime.NativeCalls_GetErrorMessage with ()				& ")");		return {			_ref: theRef,			GetFunction: kNativeLibrary_GetFunction,			Close: kNativeLibrary_Close		};	end);DefConst('kInstallNativeFns, func()begin	DefGlobalFn('|Einstein:BreakInMonitor|, NSRuntime.BreakInMonitor);	DefGlobalFn('|Einstein:Log|, NSRuntime.Log);	DefGlobalFn('CalibrateTablet,  NSRuntime.CalibrateTablet);	DefGlobalFn('|Einstein:Quit|, NSRuntime.QuitEinstein);	DefGlobalFn('ConvertToUniStr,  NSRuntime.ConvertToUniStr);	DefGlobalFn('ConvertFromUniStr,  NSRuntime.ConvertFromUniStr);	DefGlobalFn('OpenNativeLibrary, kOpenNativeLibraryFn);	DefGlobalFn('GetErrno,  NSRuntime.NativeCalls_GetErrno);end);