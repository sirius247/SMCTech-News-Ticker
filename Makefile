SDKVERSION=5.0
include theos/makefiles/common.mk

BUNDLE_NAME = SMCNews
SMCNews_FILES = SMCNewsController.m
SMCNews_INSTALL_PATH = /System/Library/WeeAppPlugins/
SMCNews_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
