// ==============================
// File:			TMonitor.h
// Project:			Einstein
//
// Copyright 2003-2007 by Paul Guyot (pguyot@kallisys.net).
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
// ==============================
// $Id$
// ==============================

#ifndef _TMONITOR_CORE_H
#define _TMONITOR_CORE_H

#include <K/Defines/KDefinitions.h>

#include "Emulator/Log/TBufferLog.h"
#include "Emulator/JIT/JIT.h"

class TEmulator;
class TMemory;
class TARMProcessor;
class TInterruptManager;
class TSymbolList;
class TJITGenericRetarget;

///
/// Base class for the monitor.
///
/// \author Matthias Melcher (einstein@matthiasm.com)
/// \version $Revision: 113 $
///
class TMonitorCore
{
public:
	///
	/// Constructor
	///
	TMonitorCore(TSymbolList* inSymbolList);

	///
	/// Destructor.
	///
	virtual ~TMonitorCore();
	
	///
	/// Output a line.
	///
	virtual void PrintLine(const char* inLine);

	///
	/// Execute a script.
	///
	/// \return false, if the script file was not found, or the result of
	///         the script operations.
	///
	Boolean		ExecuteScript( const char* inScriptFile );
	
	///
	/// Execute a command.
	///
	/// \return true if the command was known.
	///
	virtual Boolean ExecuteCommand( const char* inCommand );

#ifdef JITTARGET_GENERIC
	///
	/// Execute a retargeting command.
	///
	/// \return true if the command was known.
	///
	Boolean ExecuteRetargetCommand( const char* inCommand );
#endif

	/// \name Variables
	TMemory*				mMemory;			///< Memory.
	TSymbolList*			mSymbolList;		///< List of symbols.
#ifdef JITTARGET_GENERIC
	TJITGenericRetarget*	mRetarget;			///< retargeting source code generator
#endif
};

#endif
		// _TMONITOR_CORE_H

// ============================ //
// All constants are variables. //
// ============================ //
