PRODUCT_BRAND ?= omni

# bootanimation
PRODUCT_COPY_FILES += \
	vendor/omni/bootanimation.zip:system/media/bootanimation.zip

# general properties
PRODUCT_PROPERTIES_OVERRIDE += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false \
	persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/omni/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/omni/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/omni/prebuilt/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel \
    vendor/omni/prebuilt/etc/init.d/00su:system/etc/init.d/00su \
    vendor/omni/prebuilt/bin/blacklist:system/addon.d/blacklist

# superUSER
#PRODUCT_COPY_FILES += \
#      vendor/XPE/SuperSU/bin/.ext:system \
#      vendor/XPE/SuperSU/install-recovery.sh:system/etc/install-recovery.sh \
#      vendor/XPE/SuperSU/su:system/xbin/su \
#      vendor/XPE/SuperSU/su:system/bin/su \
#      vendor/XPE/SuperSU/chattr:system/bin/chattr \
#      vendor/XPE/SuperSU/chattr:system/xbin/chattr

#XPE files
#BUILD_PREBUILD =+ \
#      vendor/XPE/OTA.apk:system/app/OTA.apk \
#      vendor/XPE/SuperSU/superuser.apk:system/app/superuser.apk  

# init.d support
PRODUCT_COPY_FILES += \
	vendor/omni/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
	vendor/omni/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/omni/prebuilt/etc/init.local.rc:root/init.omni.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/omni/config/packages.mk

# Versionning
-include vendor/omni/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/common
