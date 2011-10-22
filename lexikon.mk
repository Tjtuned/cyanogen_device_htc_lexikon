#
# Copyright (C) 2011 The CyanogenMod Project
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
#

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/lexikon/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/lexikon/init.lexikon.rc:root/init.lexikon.rc \
    device/htc/lexikon/ueventd.lexikon.rc:root/ueventd.lexikon.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
        dalvik.vm.lockprof.threshold=500 \
        dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/lexikon/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

PRODUCT_PACKAGES += \
    lights.lexikon \
    gps.lexikon \
    sensors.lexikon 

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/lexikon/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/lexikon/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/lexikon/keychars/lexikon-keypad.kcm.bin:system/usr/keychars/lexikon-keypad.kcm.bin \
    device/htc/lexikon/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/lexikon/keylayout/lexikon-keypad.kl:system/usr/keylayout/lexikon-keypad.kl \
    device/htc/lexikon/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/lexikon/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/lexikon/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/lexikon/firmware/BCM4329B1_002.002.023.0511.0557.hcd:system/etc/firmware/BCM4329B1_002.002.023.0511.0557.hcd \
    device/htc/lexikon/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/lexikon/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/lexikon/firmware/default_org_nel.acdb:system/etc/firmware/default_org_nel.acdb \
    device/htc/lexikon/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    device/htc/lexikon/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin \
    device/htc/lexikon/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/lexikon/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/lexikon/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/lexikon/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/lexikon/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 



# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# lexikon uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/htc/lexikon/vold.fstab:system/etc/vold.fstab \
    device/htc/lexikon/apns-conf.xml:system/etc/apns-conf.xml

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/lexikon/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/lexikon/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    
PRODUCT_COPY_FILES += \
    device/htc/lexikon/prebuilt/libcryp98.so:system/lib/libcryp98.so

$(call inherit-product-if-exists, vendor/htc/lexikon/lexikon-vendor.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/lexikon/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/lexikon/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)


PRODUCT_NAME := htc_lexikon
PRODUCT_DEVICE := lexikon
