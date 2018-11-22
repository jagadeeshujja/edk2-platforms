/** @file
  Provides a platform-specific method to enable Secure Boot Custom Mode setup.

  Copyright (c) 2006 - 2012, Intel Corporation. All rights reserved.<BR>
  Copyright (c) 2018, ARM Limited. All rights reserved.

  This program and the accompanying materials
  are licensed and made available under the terms and conditions of the BSD License
  which accompanies this distribution.  The full text of the license may be found at
  http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/
#include <Library/PcdLib.h>

/**

  UefiRuntimeServicesTableLibNull is a dummy implantation of  UefiRuntimeServicesTableLib
  and used by MM_STANDALONE drivers Like BaseCryptLib.inf


**/

BOOLEAN
EFIAPI
UefiRuntimeServicesTableLibNull (
  VOID
  )
{
  return TRUE;
}
