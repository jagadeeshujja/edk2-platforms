/** @file

  Copyright (c) 2018, ARM Ltd. All rights reserved.

  This program and the accompanying materials are licensed and made available
  under the terms and conditions of the BSD License which accompanies this
  distribution.  The full text of the license may be found at
  http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

 **/

#include <PiDxe.h>
#include <PiMm.h>
#include <Library/DebugLib.h>
#include <Library/IoLib.h>
#include <Library/NorFlashPlatformLib.h>
#include <Library/StandaloneMmServicesTableLib.h>
#include <SgiPlatform.h>

STATIC NOR_FLASH_DESCRIPTION mNorFlashDevices[] = {
  {
    SGI_EXP_SMC_CS0_BASE,
    SGI_EXP_SMC_CS0_BASE,
    SIZE_256KB * 256,
    SIZE_256KB,
  },
  {
    SGI_EXP_SMC_CS1_BASE,
    SGI_EXP_SMC_CS1_BASE,
    SIZE_256KB * 256,
    SIZE_256KB,
  },
};

STATIC NOR_FLASH_DESCRIPTION mSecureNorFlashDevices[] = {
  {
    // Secure Boot storage space of 4MB
    SGI_EXP_SMC_CS2_BASE,
    SGI_EXP_SMC_CS2_BASE,
    SIZE_256KB * 16,
    SIZE_256KB,
  },
  {
    //Secure variable storage space of 1MB*3
    SGI_EXP_SMC_CS2_BASE,
    SGI_EXP_SMC_CS2_BASE + SIZE_256KB * 16,
    SIZE_256KB * 12,
    SIZE_256KB,
  },
};

EFI_STATUS
NorFlashPlatformInitialization (
  VOID
  )
{
  UINT64 SysRegFlash;

  SysRegFlash = SGI_EXP_SYSPH_SYSTEM_REGISTERS + SGI_SYSPH_SYS_REG_FLASH;
  MmioOr32 (SysRegFlash, SGI_SYSPH_SYS_REG_FLASH_RWEN);
  return EFI_SUCCESS;
}

EFI_STATUS
NorFlashPlatformGetDevices (
  OUT NOR_FLASH_DESCRIPTION   **NorFlashDevices,
  OUT UINT32                  *Count
  )
{
  if ((NorFlashDevices == NULL) || (Count == NULL)) {
    return EFI_INVALID_PARAMETER;
  }

  if (!InMm ()) {
    *NorFlashDevices = mNorFlashDevices;
    *Count = ARRAY_SIZE (mNorFlashDevices);
  } else {
    *NorFlashDevices = mSecureNorFlashDevices;
    *Count = ARRAY_SIZE (mSecureNorFlashDevices);
  }
  return EFI_SUCCESS;
}
