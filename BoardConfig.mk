#####
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from the proprietary version
-include vendor/samsung/young23g/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := scx15
TARGET_BOARD_PLATFORM_GPU := mali-400 MP
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := false
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := SC7715A
BOARD_VENDOR := samsung

# Config u-boot
TARGET_NO_BOOTLOADER := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1111490560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2457862144
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/young23g/ril

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/young23g/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/young23g/bluetooth/libbt_vndcfg.txt
#USE_BLUETOOTH_BCM4343 := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4343
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true

# Hardware rendering
BOARD_EGL_CFG := device/samsung/young23g/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
#BOARD_EGL_NEEDS_FNW := true
#TARGET_GPU_PP_CORE := 2
#USE_SPRD_HWCOMPOSER := true
#USE_OVERLAY_COMPOSER_GPU := true
#DEVICE_FORCE_VIDEO_GO_OVERLAYCOMPOSER := true
TARGET_USES_ION := true
HWUI_COMPILE_FOR_PERF := true
COMMON_GLOBAL_CFLAGS += -DSCX15_HWC

# Resolution
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Audio
#BOARD_USES_TINYALSA_AUDIO := true

# Board specific features
#BOARD_USE_VETH := true
#BOARD_SPRD_RIL := true
#BOARD_SAMSUNG_RIL := true
COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd-young23g.scx15

# Camera
CAMERA_SUPPORT_SIZE := 3M
#android zsl capture
TARGET_BOARD_CAMERA_ANDROID_ZSL_MODE := false
#back camera rotation capture
TARGET_BOARD_BACK_CAMERA_ROTATION := false
#front camera rotation capture
TARGET_BOARD_FRONT_CAMERA_ROTATION := false
#rotation capture
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false
TARGET_BOARD_CAMERA_HAL_VERSION := HAL1.0

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := young23g-native_hw03_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/young23g

# Init
TARGET_NR_SVC_SUPP_GIDS := 48

# Recovery
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Assert
TARGET_OTA_ASSERT_DEVICE := young23g,SM-G130H,young23gxx

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/young23g/sepolicy
BOARD_SEPOLICY_UNION :=	\
	file.te	\
	file_contexts \
	seapp_contexts \
	theme.te \
	healthd.te \
	init.te \
	init_shell.te \
	installd.te \
	netd.te \
	shell.te \
	system.te \
	untrusted_app.te \
	vold.te	\
	zygote.te

# Enable dex-preoptimization to speed up the first boot sequence
WITH_DEXPREOPT := true

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ device/samsung/young23g/cmhw/

# TWRP
RECOVERY_GRAPHICS_USE_LINELENGTH := true
SP1_NAME := "internal_sd"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/platform/sec-thermistor/temperature"
TWHAVE_SELINUX := true
TARGET_RECOVERY_INITRC := device/samsung/young23g/etc/init.rc
TARGET_RECOVERY_FSTAB := device/samsung/young23g/ramdisk/twrp.fstab
TW_HAS_DOWNLOAD_MODE := true
DEVICE_RESOLUTION := 320x480
TW_THEME := portrait_mdpi
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"

