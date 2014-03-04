#
# Makefile for gnote
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := lewa_I9305.zip

# the location for local-ota to save target-file
local-previous-target-dir := ~/workspace/ota_base/sam_4.2

# All apps from original ZIP, but has smali files chanded
local-modified-apps := 

local-modified-jars :=

# All apks from LEWA
local-lewa-removed-apps :=

local-lewa-modified-apps := 

# set ro.sys.partner in build.prop for lewa partner
local-lewa-partner := ROMMER_NIAN

local-lewa-device := N7100

# Config density for co-developers to use the aaps with HDPI or XHDPI resource,
# Default configrations are HDPI for ics branch and XHDPI for jellybean branch
local-density := XHDPI

# All apps need to be removed from original ZIP file
local-remove-apps   := Gallery2 Stk Launcher2 VideoEditor PicoTts VoiceDialer \
		HoloSpiralWallpaper MagicSmokeWallpapers PhaseBeam Galaxy4 NoiseField \ 
		Calculator Contacts DeskClock Mms Music PackageInstaller QuickSearchBox SoundRecorder

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-pre-zip-misc
local-after-zip:= local-put-to-phone

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
#updater := $(ZIP_DIR)/META-INF/com/google/android/updater-script
#pre_install_data_packages := $(TMP_DIR)/pre_install_apk_pkgname.txt
local-pre-zip-misc: add-prebuilt-lewa-sqlite-library
	cp other/boot.img $(ZIP_DIR)/boot.img
	cp other/updater-script $(ZIP_DIR)/META-INF/com/google/android/updater-script
	
	@echo Remove usless stuff
	rm -rf $(ZIP_DIR)/data/media/preinstall_apps/*.apk
	rm -rf $(ZIP_DIR)/system/media/video/*.mp4
	rm -rf $(ZIP_DIR)/system/tts/lang_pico/*.bin

