## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := young23g

# Custom unofficial build tag
TARGET_UNOFFICIAL_BUILD_ID := wulan17

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/young23g/device_young23g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := young23g
PRODUCT_NAME := young23g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G130H
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone

