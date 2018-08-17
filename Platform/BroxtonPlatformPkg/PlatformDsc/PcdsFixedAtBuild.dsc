## @file
#  Platform Fixed At Build Pcd Description.
#
#  Copyright (c) 2016 - 2018, Intel Corporation. All rights reserved.<BR>
#
#  This program and the accompanying materials
#  are licensed and made available under the terms and conditions of the BSD License
#  which accompanies this distribution. The full text of the license may be found at
#  http://opensource.org/licenses/bsd-license.php.
#
#  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
##

  # PcdTemporaryRamBase + PcdTemporaryRamSize should equal top of CAR
  # Top of CAR (CarBase + CarSize) = 0xFF000000 on BXT
  !if $(PERFORMANCE_ENABLE) == TRUE
     gPlatformModuleTokenSpaceGuid.PcdTemporaryRamBase|0xFEFC0000
     gPlatformModuleTokenSpaceGuid.PcdTemporaryRamSize|0x00040000
  !else
     gPlatformModuleTokenSpaceGuid.PcdTemporaryRamBase|0xFEFD5100
     gPlatformModuleTokenSpaceGuid.PcdTemporaryRamSize|0x0002AF00
  !endif

  gPlatformModuleTokenSpaceGuid.PcdPeiTemporaryRamStackSize|0x2000

  !if $(INTEL_FPDT_ENABLE) == TRUE
     gEfiMdeModulePkgTokenSpaceGuid.PcdExtFpdtBootRecordPadSize|0x1000
  !endif

  !if $(SECURE_BOOT_ENABLE) == TRUE
     gEfiMdeModulePkgTokenSpaceGuid.PcdMaxVariableSize|0x10000
  !else
     gEfiMdeModulePkgTokenSpaceGuid.PcdMaxVariableSize|0x5000
  !endif

  gEfiMdeModulePkgTokenSpaceGuid.PcdHwErrStorageSize|0x00000800
  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxHardwareErrorVariableSize|0x400

  gEfiIntelFrameworkModulePkgTokenSpaceGuid.PcdS3AcpiReservedMemorySize|0x1800000
  gEfiMdeModulePkgTokenSpaceGuid.PcdShadowPeimOnS3Boot|TRUE
  gEfiMdeModulePkgTokenSpaceGuid.PcdPeiCoreMaxPeimPerFv|50
  gEfiMdeModulePkgTokenSpaceGuid.PcdSrIovSupport|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdAriSupport|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdPeiCoreMaxPpiSupported|128

  !if $(S4_ENABLE) == TRUE
     gEfiMdeModulePkgTokenSpaceGuid.PcdResetOnMemoryTypeInformationChange|TRUE
  !else
     gEfiMdeModulePkgTokenSpaceGuid.PcdResetOnMemoryTypeInformationChange|FALSE
  !endif
  !if $(TARGET) == RELEASE
     gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x0
     gEfiMdePkgTokenSpaceGuid.PcdReportStatusCodePropertyMask|0x3
  !else
     gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x2F
     gEfiMdePkgTokenSpaceGuid.PcdReportStatusCodePropertyMask|0x07
  !endif
  !if $(PERFORMANCE_ENABLE) == TRUE
     gEfiMdePkgTokenSpaceGuid.PcdPerformanceLibraryPropertyMask|0x1
     !if $(INTEL_FPDT_ENABLE) == TRUE
        gEfiMdeModulePkgTokenSpaceGuid.PcdMaxPeiPerformanceLogEntries|120
     !else
        gEfiMdeModulePkgTokenSpaceGuid.PcdMaxPeiPerformanceLogEntries|60
     !endif
  !endif

  gEfiIntelFrameworkModulePkgTokenSpaceGuid.PcdEbdaReservedMemorySize|0x10000
  gEfiMdeModulePkgTokenSpaceGuid.PcdLoadModuleAtFixAddressEnable|$(TOP_MEMORY_ADDRESS)
  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress|0x$(PLATFORM_PCIEXPRESS_BASE)
  gEfiMdeModulePkgTokenSpaceGuid.PcdBrowserSubtitleTextColor|0x0
  gEfiMdeModulePkgTokenSpaceGuid.PcdBrowserFieldTextColor|0x01
  gClientCommonModuleTokenSpaceGuid.PcdMaxConsoleDeviceNum|0x05

  gEfiIntelFrameworkModulePkgTokenSpaceGuid.PcdBiosVideoCheckVbeEnable|TRUE
  gEfiIntelFrameworkModulePkgTokenSpaceGuid.PcdBiosVideoCheckVgaEnable|TRUE

  gEfiBxtTokenSpaceGuid.PcdPmcGcrBaseAddress|0xFE043000

  !if $(SOURCE_DEBUG_ENABLE) == TRUE
    gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x17
    gEfiMdePkgTokenSpaceGuid.PcdReportStatusCodePropertyMask|0x07
    gEfiMdeModulePkgTokenSpaceGuid.PcdSerialUseHardwareFlowControl|FALSE
  !endif
  
  gUefiCpuPkgTokenSpaceGuid.PcdCpuSmmStackSize|0x3000
  
  !if $(UP2_BOARD) == TRUE || $(MODULE_BOARD) == TRUE
    gPlatformModuleTokenSpaceGuid.PcdSerialIoUartNumber|0
  !else 
    gPlatformModuleTokenSpaceGuid.PcdSerialIoUartNumber|2
  !endif
  #
  # EEPROM GPIO Whitelist
  gPlatformModuleTokenSpaceGuid.PcdGpioWhiteList | {0x08, 0x05, 0xC0, 0x00, 0x78, 0x05, 0xC0, 0x00, 0x80, 0x05, 0xC0, 0x00, 0x88, 0x05, 0xC0, 0x00, 0x90, 0x05, 0xC0, 0x00, 0xA0, 0x05, 0xC0, 0x00, 0xC8, 0x05, 0xC0, 0x00, 0xD0, 0x05, 0xC0, 0x00, 0xE0, 0x05, 0xC0, 0x00, 0xF0, 0x05, 0xC0, 0x00, 0xF8, 0x05, 0xC0, 0x00, 0x30, 0x05, 0xC4, 0x00, 0x48, 0x05, 0xC4, 0x00, 0x50, 0x05, 0xC4, 0x00, 0x58, 0x05, 0xC4, 0x00, 0x60, 0x05, 0xC4, 0x00, 0x68, 0x05, 0xC4, 0x00, 0x80, 0x05, 0xC4, 0x00, 0x88, 0x05, 0xC4, 0x00, 0x98, 0x05, 0xC4, 0x00, 0x60, 0x06, 0xC4, 0x00, 0x60, 0x06, 0xC4, 0x00, 0x68, 0x06, 0xC4, 0x00, 0x70, 0x06, 0xC4, 0x00, 0x78, 0x06, 0xC4, 0x00, 0x80, 0x06, 0xC4, 0x00, 0xA8, 0x06, 0xC4, 0x00, 0xB0, 0x06, 0xC4, 0x00, 0xB8, 0x06, 0xC4, 0x00, 0xC0, 0x06, 0xC4, 0x00, 0xD8, 0x06, 0xC4, 0x00, 0xE8, 0x06, 0xC4, 0x00, 0xF0, 0x06, 0xC4, 0x00, 0xF8, 0x06, 0xC4, 0x00, 0x00, 0x07, 0xC4, 0x00, 0x08, 0x07, 0xC4, 0x00, 0x18, 0x07, 0xC4, 0x00, 0x20, 0x07, 0xC4, 0x00, 0x10, 0x05, 0xC5, 0x00, 0x18, 0x05, 0xC5, 0x00, 0x20, 0x05, 0xC5, 0x00, 0x30, 0x05, 0xC5, 0x00, 0x38, 0x05, 0xC5, 0x00, 0x68, 0x05, 0xC5, 0x00, 0x70, 0x05, 0xC5, 0x00, 0xA8, 0x05, 0xC5, 0x00, 0xB0, 0x05, 0xC5, 0x00, 0xB8, 0x05, 0xC5, 0x00, 0xC0, 0x05, 0xC5, 0x00, 0xC8, 0x05, 0xC5, 0x00, 0xD0, 0x05, 0xC5, 0x00, 0x30, 0x06, 0xC5, 0x00, 0x38, 0x06, 0xC5, 0x00, 0x40, 0x06, 0xC5, 0x00, 0x48, 0x06, 0xC5, 0x00, 0x50, 0x06, 0xC5, 0x00, 0x58, 0x06, 0xC5, 0x00, 0x70, 0x06, 0xC5, 0x00, 0x78, 0x06, 0xC5, 0x00, 0x80, 0x06, 0xC5, 0x00, 0x88, 0x06, 0xC5, 0x00, 0xA0, 0x06, 0xC5, 0x00, 0xA8, 0x06, 0xC5, 0x00, 0xB0, 0x06, 0xC5, 0x00, 0xB8, 0x06, 0xC5, 0x00, 0x10, 0x05, 0xC7, 0x00, 0x18, 0x05, 0xC7, 0x00, 0x40, 0x05, 0xC7, 0x00, 0x48, 0x05, 0xC7, 0x00, 0x50, 0x05, 0xC7, 0x00, 0x58, 0x05, 0xC7, 0x00, 0x60, 0x05, 0xC7, 0x00, 0x68, 0x05, 0xC7, 0x00, 0x70, 0x05, 0xC7, 0x00, 0x78, 0x05, 0xC7, 0x00, 0x80, 0x05, 0xC7, 0x00, 0x88, 0x05, 0xC7, 0x00, 0x90, 0x05, 0xC7, 0x00, 0x98, 0x05, 0xC7, 0x00, 0xF0, 0x05, 0xC7, 0x00, 0x18, 0x06, 0xC7, 0x00, 0x20, 0x06, 0xC7, 0x00, 0x28, 0x06, 0xC7, 0x00, 0x48, 0x06, 0xC7, 0x00, 0xFF, 0xFF, 0xFF, 0xFF}

