#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Target VNDK Fallback version
PRODUCT_EXTRA_VNDK_VERSIONS := 30 31 32 33 34

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

ifeq ($(TARGET_IS_VAB),true)
VULKAN_DEQP_LEVEL := 2020-03-01
else
VULKAN_DEQP_LEVEL := 2019-03-01
endif
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-$(VULKAN_DEQP_LEVEL).xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# A/B
ifeq ($(TARGET_IS_VAB),true)
# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script
endif

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.3-impl

PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.primary.kona \
    audio.r_submix.default \
    audio.usbv2.default \

PRODUCT_PACKAGES += \
    liba2dpoffload \
    libaudiopreprocessing \
    libbatterylistener \
    libbundlewrapper \
    libcomprcapture \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libsndmonitor \
    libspkrprot \
    libvisualizer \
    libvolumelistener

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Consumer IR
ifneq ($(TARGET_IS_TABLET),true)
PRODUCT_PACKAGES += \
    android.hardware.ir-service.xiaomi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml
endif

# Device-specific settings
PRODUCT_PACKAGES += \
    XiaomiParts

ifeq ($(TARGET_USES_MIUI_DOLBY),true)
# Miui Dolby Engine Topic
# Dolby Sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/dolby/private
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/dolby/vendor

# Dolby Props
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.dolby.dax.version=DAX3_3.6.1.6_r1 \
    ro.vendor.audio.dolby.dax.version=DAX3_3.6 \
    ro.vendor.audio.dolby.dax.support=true \
    ro.vendor.audio.dolby.surround.enable=true

# Dolby Effects Props
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.audio.delta.refresh=true

# MiSound with Dolby Environment (By Default - Disabled)
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.audio.misound.disable=true \
    ro.vendor.audio.misound.bluetooth.enable=true

# Dolby MediaCodecs Loading Support (Overwrites Vendor files)
PRODUCT_PACKAGES += \
    media_codecs_dolby_audio.xml

# XiaomiDolby
PRODUCT_PACKAGES += \
    XiaomiDolby

# Dolby MediaCodecs Dependenices
PRODUCT_PACKAGES += \
    libcodec2_hidl@1.0.vendor \
    libcodec2_soft_common.vendor \
    libstagefright_softomx.vendor \
    libstagefright_softomx_plugin.vendor
else
# MiSound (Dirac Only)
# MiSound without Dolby (By Default - Enabled)
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.audio.misound.disable=false \
    ro.vendor.audio.misound.bluetooth.enable=true
endif

# Display
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.composer-service

PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.allocator-service

PRODUCT_PACKAGES += \
    vendor.qti.hardware.memtrack-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
ifneq ($(TARGET_IS_TABLET),true)
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

ifeq ($(TARGET_HAS_UDFPS),true)
PRODUCT_PACKAGES += \
    libudfpshandler \
    sensors.udfps
endif
endif

# Hail
PRODUCT_PACKAGES += \
    Hail

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti

ifneq ($(TARGET_IS_VAB),true)
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti_recovery
endif

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAAService
PRODUCT_PACKAGES += \
    IFAAService

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# Input
PRODUCT_PACKAGES += \
    Xiaomi_Smart_Pen_Keyboard.kl \
    kona-mtp-snd-card_Button_Jack.kl \
    uinput-fortsense.kl \
    uinput-fpc.kl \
    uinput-goodix.kl

PRODUCT_PACKAGES += \
    Xiaomi_Keyboard.idc \
    uinput-fortsense.idc \
    uinput-fpc.idc \
    uinput-goodix.idc

# Kernel
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

# Media configs
PRODUCT_PACKAGES += \
    media_codecs_c2.xml \
    media_codecs_performance_c2.xml \
    media_codecs_kona.xml \
    media_codecs_performance_kona.xml \
    video_system_specs.json

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    com.android.nfc_extras \
    NfcNci \
    nqnfcinfo \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.nxp.mifare.xml

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigCommonOverlay \
    FrameworksCommonOverlay \
    NetworkStackOverlayCN \
    SettingsCommonOverlay \
    SettingsProviderCommonOverlay \
    SystemUICommonOverlay \
    TelephonyCommonOverlay

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.lineage-libperfmgr \
    libqti-perfd-client

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom_ramdisk

PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.mdm.sh \
    init.mi.btmac.sh \
    init.panel_info.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.qti.dcvs.sh

PRODUCT_PACKAGES += \
    fstab.zram \
    init.qcom.power.rc \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    init.xiaomi.rc \
    ueventd.qcom.rc

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl-xiaomi \
    android.hardware.sensors@1.0-service

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/lineage/interfaces/power-libperfmgr \
    hardware/qcom-caf/common/libqti-perfd-client \
    hardware/xiaomi \
    vendor/qcom/opensource/usb/etc

# Scudo
PRODUCT_USE_SCUDO := true
PRODUCT_USE_SCUDO_32_BIT := true

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext \
    xiaomi-telephony-stub

PRODUCT_BOOT_JARS += \
    telephony-ext \
    xiaomi-telephony-stub

# Thermal
ifeq ($(TARGET_USE_QTI_THERMAL_SERVICE),true)
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti
endif

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.qti

PRODUCT_PACKAGES += \
    init.qcom.usb.rc \
    init.qcom.usb.sh

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vibrator
ifneq ($(TARGET_IS_TABLET),true)
$(call inherit-product, vendor/qcom/opensource/vibrator/vibrator-vendor-product.mk)
endif

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwpa_client \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    WifiCommonOverlay \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    firmware_WCNSS_qcom_cfg.ini_symlink \
    firmware_wlan_mac.bin_symlink

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Wi-Fi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor

PRODUCT_BOOT_JARS += \
    WfdCommon

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/sm8250-common/sm8250-common-vendor.mk)
