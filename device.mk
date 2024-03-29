# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/young23g/young23g-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# languages
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.locale.language=en \
    ro.product.locale.region=US

# Init files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
	$(LOCAL_PATH)/ramdisk/init.board.rc:root/init.board.rc \
	$(LOCAL_PATH)/ramdisk/init.scx15_ss.rc:root/init.scx15_ss.rc \
	$(LOCAL_PATH)/ramdisk/init.young23g.rc:root/init.young23g.rc \
	$(LOCAL_PATH)/ramdisk/init.young23g_base.rc:root/init.young23g_base.rc \
	$(LOCAL_PATH)/ramdisk/init.wifi.rc:root/init.wifi.rc \
	$(LOCAL_PATH)/ramdisk/fstab.scx15:root/fstab.scx15 \
	$(LOCAL_PATH)/ramdisk/init.board.rc:root/init.board.rc \
	$(LOCAL_PATH)/ramdisk/init.scx15.rc:root/init.scx15.rc \
	$(LOCAL_PATH)/ramdisk/init.scx15.usb.rc:root/init.scx15.usb.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.scx15.rc:root/ueventd.scx15.rc \
        $(LOCAL_PATH)/ramdisk/init.recovery.scx15.rc:root/init.recovery.scx15.rc

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/ramdisk/etc/extra.fstab:recovery/root/etc/extra.fstab

# Override phone-hdpi-512-dalvik-heap to match value on stock
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=64m

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.service.adb.enable=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_young23g
PRODUCT_DEVICE := young23g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G130H
