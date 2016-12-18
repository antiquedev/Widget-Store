include theos/makefiles/common.mk

APPLICATION_NAME = WidgetStore
WidgetStore_FILES = main.m XXAppDelegate.m XXRootViewController.m
WidgetStore_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"WidgetStore\"" || true
