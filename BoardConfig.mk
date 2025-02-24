#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/LI9

TW_FORCE_SELINUX_PERMISSIVE := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES                   := true
BUILD_BROKEN_DUP_RULES                       := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH                := arm64
TARGET_ARCH_VARIANT        := armv8-a
TARGET_CPU_ABI             := arm64-v8a
TARGET_CPU_ABI2            := 
TARGET_CPU_VARIANT         := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH                := arm
TARGET_2ND_ARCH_VARIANT        := armv7-a-neon
TARGET_2ND_CPU_ABI             := armeabi-v7a
TARGET_2ND_CPU_ABI2            := armeabi
TARGET_2ND_CPU_VARIANT         := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := LI9

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := LI9
TARGET_NO_BOOTLOADER         := flase
TARGET_USES_UEFI             := true

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Kernel
BOARD_RAMDISK_USE_LZ4 := true
TARGET_NO_KERNEL      := true

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE    := 0x40078000
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_PAGE_SIZE      := 4096
BOARD_KERNEL_OFFSET  := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_TAGS_OFFSET    := 0x07c08000
BOARD_DTB_OFFSET     := 0x07c08000

BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# DTB - prebuilt
TARGET_PREBUILT_DTB  := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD    := true

# Hardware
BOARD_USES_MTK_HARDWARE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE                        := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE                := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE         := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_HAS_LARGE_FILESYSTEM                    := true
BOARD_SUPER_PARTITION_SIZE                    := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS                  := tecno_dynamic_partitions
BOARD_TECNO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product system_ext
BOARD_TECNO_DYNAMIC_PARTITIONS_SIZE           := 9122611200 # TODO: Fix hardcoded value

# Partitions - file type
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE     := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE      := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE  := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE    := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE      := erofs
TARGET_USERIMAGES_USE_EXT4              := true
TARGET_USERIMAGES_USE_F2FS              := true

TARGET_COPY_OUT_PRODUCT                 := product
TARGET_COPY_OUT_SYSTEM                  := system
TARGET_COPY_OUT_SYSTEM_EXT              := system_ext
TARGET_COPY_OUT_VENDOR                  := vendor

# Platform
TARGET_BOARD_PLATFORM := mt6833

# Recovery
TARGET_NO_RECOVERY              := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_HAS_NO_SELECT_BUTTON      := true
TARGET_RECOVERY_PIXEL_FORMAT    := RGBX_8888
BOARD_SUPPRESS_SECURE_ERASE     := true
TARGET_RECOVERY_FSTAB           := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Treble
BOARD_VNDK_VERSION := current

# Crypto
TW_INCLUDE_CRYPTO               := true
TW_INCLUDE_CRYPTO_FBE           := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION   := true
TW_USE_FSCRYPT_POLICY           := 2
TW_FORCE_KEYMASTER_VER          := true

PLATFORM_VERSION                := 14
PLATFORM_VERSION_LAST_STABLE    := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH         := 2099-12-31
VENDOR_SECURITY_PATCH           := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH             := $(PLATFORM_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ENABLE                           := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS           += --flags 3
BOARD_AVB_ROLLBACK_INDEX                   := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ALGORITHM               := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH                := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX          := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Screen
TARGET_SCREEN_WIDTH   := 1080
TARGET_SCREEN_HEIGHT  := 2436
TARGET_SCREEN_DENSITY := 480

# TWRP Configuration
TW_EXTRA_LANGUAGES            := true
TARGET_USES_MKE2FS            := true

TW_FRAMERATE          := 90
TW_BRIGHTNESS_PATH    := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS     := 255
TW_DEFAULT_BRIGHTNESS := 100
TW_NO_SCREEN_BLANK    := true
TARGET_LD_SHIM_LIBS := libminuitwrp
TW_NO_CPU_TEMP := true


# Tools
TW_INCLUDE_FB2PNG       := true
TW_INCLUDE_NTFS_3G      := true
TW_INCLUDE_REPACKTOOLS  := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP    := true
TW_INCLUDE_LPTOOLS      := true
TW_EXCLUDE_LPDUMP       := true
TW_EXCLUDE_APEX         := true

# no recovery partition
TW_HAS_NO_RECOVERY_PARTITION := true

# StatusBar
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS     := "300"
TW_CUSTOM_CLOCK_POS   := "70"
TW_CUSTOM_BATTERY_POS := "790"

# FastbootD
TW_INCLUDE_FASTBOOTD := true

# USB Configuration
TW_EXCLUDE_DEFAULT_USB_INIT := true

# USB OTG
TW_USB_STORAGE := true

#MTP
TW_HAS_MTP := true
TW_MTP_DEVICE := "/dev/usb-ffs/mtp"
TW_INCLUDE_LIBUSB := true

#VIBRA
TW_HAS_VIBRATION := true
TW_NO_HAPTICS := false
TW_HAPTICS_PATH := "/sys/class/leds/vibrator_single/activate"
TW_HAPTICS_DURATION_PATH := "/sys/class/leds/vibrator_single/duration"

# Vendor Boot
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE     := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# Init
TARGET_INIT_VENDOR_LIB         := libinit_LI9
TARGET_RECOVERY_DEVICE_MODULES := libinit_LI9

# Vendor Modules
TW_LOAD_VENDOR_BOOT_MODULES := true

# Version
TW_DEVICE_VERSION := Shah_qufi | LI9

