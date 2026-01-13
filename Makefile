export PACKAGE_FORMAT = ipa
TARGET = iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GiaoDienPro
GiaoDienPro_FILES = Tweak.xm MenuView.m
GiaoDienPro_FRAMEWORKS = UIKit CoreGraphics QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
