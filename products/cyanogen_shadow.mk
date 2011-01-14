# Inherit AOSP device configuration for passion.
$(call inherit-product, device/motorola/shadow/device.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_shadow
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := shadow
PRODUCT_MODEL := DROIDX
PRODUCT_MANUFACTURER := Motorola

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-DroidX
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-DroidX
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-DroidX-KANG
    endif
endif

# 2.2 build prop overrides
PRODUCT_BUILD_PROP_OVERRIDES := \
BUILD_ID=VZW \
BUILD_DISPLAY_ID=VZW \
BUILD_NUMBER=2.3.340 \
BUILD_DATE_UTC=1289194863 \
TARGET_BUILD_TYPE=user \
USER=w30471 \
BUILD_VERSION_TAGS=test-keys \
PRODUCT_MODEL_INTERNAL=MB810 \
PRODUCT_BRAND=verizon \
PRODUCT_NAME=shadow_vzw \
TARGET_DEVICE=cdma_shadow \
BUILD_PRODUCT=shadow_vzw \
PRIVATE_BUILD_DESC="cdma_shadow-user 2.2.1 VZW 2.3.340 ota-rel-keys,release-keys" \
BUILD_FINGERPRINT=verizon/shadow_vzw/cdma_shadow/shadow:2.2.1/VZW/23.340:user/ota-rel-keys,release-keys

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/shadow

# Add the Torch app
PRODUCT_PACKAGES += Torch


# include proprietaries for now
USE_PROPRIETARIES := \
motorola

