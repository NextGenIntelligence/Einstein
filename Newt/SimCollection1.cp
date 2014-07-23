/**
 * Collection of transcoded functions
 */

#include "SimCollection1.h"

#if 0

// This is code generated by the "rt" commands in the Monitor

/**
 * Automatically transcoded function TMonitor::SetResult(...)
 */
void Func_0x00120010(TARMProcessor* ioCPU)
{
L00120010: // 0xE591006C  ldr	r0, [r1, #0x06c]
	{
		KUInt32 offset = 0x0000006C;
		KUInt32 theAddress = ioCPU->mCurrentRegisters[1] + offset;
		KUInt32 theData = ioCPU->ManagedMemoryRead(theAddress);
		ioCPU->mCurrentRegisters[0] = theData;
	}
L00120014: // 0xE3100502  tst	r0, #0x00800000
	{
		KUInt32 Opnd2 = 0x00800000;
		KUInt32 Opnd1 = ioCPU->mCurrentRegisters[0];
		const KUInt32 theResult = Opnd1 & Opnd2;
		SetCPSRBitsForLogicalOp( ioCPU, theResult, Opnd2 & 0x80000000 );
	}
L00120018: // 0x0A000001  beq	00120024
	if (ioCPU->TestEQ()) {
		goto L00120024;
	}
L0012001C: // 0xE3320000  teq	r2, #0x00000000
	{
		KUInt32 Opnd2 = 0x00000000;
		KUInt32 Opnd1 = ioCPU->mCurrentRegisters[2];
		const KUInt32 theResult = Opnd1 ^ Opnd2;
		SetCPSRBitsForLogicalOpLeaveCarry( ioCPU, theResult );
	}
L00120020: // 0x01A0F00E  moveq	pc, lr
	if (ioCPU->TestEQ()) {
		KUInt32 Opnd2 = ioCPU->mCurrentRegisters[14];
		const KUInt32 theResult = Opnd2;
		SETPC(theResult + 4);
		return; //FURTHERCALLNEXT_AFTERSETPC;
	}
L00120024: // 0xE5A12010  str	r2, [r1, #0x010]!
	{
		KUInt32 offset = 0x00000010;
		KUInt32 theAddress = ioCPU->mCurrentRegisters[1] + offset;
		KUInt32 theValue = ioCPU->mCurrentRegisters[2];
		ioCPU->ManagedMemoryWrite(theAddress, theValue);
		ioCPU->mCurrentRegisters[1] = theAddress;
	}
L00120028: // 0xE1A0F00E  mov	pc, lr
	{
		KUInt32 Opnd2 = ioCPU->mCurrentRegisters[14];
		const KUInt32 theResult = Opnd2;
		SETPC(theResult + 4);
		return; //FURTHERCALLNEXT_AFTERSETPC;
	}
}
T_ROM_SIMULATION(0x00120010, "TMonitor::SetResult(...)")

#endif

/**
 * End of transcoded functions
 */