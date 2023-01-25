#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Targets
TARGET_BOOT_ANIMATION_RES := 720
TARGET_INCLUDE_PIXEL_CHARGER := true

# # Inherit from aljeter device
$(call inherit-product, device/motorola/aljeter/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_aljeter
PRODUCT_DEVICE := aljeter
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G6 Play
PRODUCT_MANUFACTURER := motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="aljeter-user 9 PPPS29.55-35-18-7 6a0d0 release-keys" \
    PRODUCT_NAME="aljeter"

BUILD_FINGERPRINT := motorola/aljeter/aljeter:9/PPPS29.55-35-18-7/6a0d0:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-motorola
