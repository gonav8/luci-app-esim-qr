include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-esim-qr
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_LICENSE:=GPL-2.0
PKG_MAINTAINER:=Your Name <you@email.com>

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-esim-qr
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=eSIM Manager for lpac (Quectel RM520N-EU)
  DEPENDS:=+lpac +zbar-tools +libcurl +luci-lib-jsonc +vnstat +luci-app-3ginfo-lite
  PKGARCH:=all
endef

define Package/luci-app-esim-qr/description
  LuCI page to manage eSIM profiles (List, Activate, Deactivate, Delete), upload eSIM QR code, and monitor modem/data usage.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-esim-qr/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./luasrc/controller/esim.lua $(1)/usr/lib/lua/luci/controller/esim.lua
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/esim
	$(INSTALL_DATA) ./luasrc/model/cbi/esim/list.lua $(1)/usr/lib/lua/luci/model/cbi/esim/list.lua
	$(INSTALL_DATA) ./luasrc/model/cbi/esim/upload.lua $(1)/usr/lib/lua/luci/model/cbi/esim/upload.lua
	$(INSTALL_DATA) ./luasrc/model/cbi/esim/usage.lua $(1)/usr/lib/lua/luci/model/cbi/esim/usage.lua
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/esim
	$(INSTALL_DATA) ./luasrc/view/esim/profile_list.htm $(1)/usr/lib/lua/luci/view/esim/profile_list.htm
	
	$(INSTALL_DIR) $(1)/usr/lib/luci/luci-app-esim-qr
	$(INSTALL_BIN) ./root/usr/lib/luci/luci-app-esim-qr/qr-upload.sh $(1)/usr/lib/luci/luci-app-esim-qr/qr-upload.sh
	$(INSTALL_BIN) ./root/usr/lib/luci/luci-app-esim-qr/lpac-wrapper.sh $(1)/usr/lib/luci/luci-app-esim-qr/lpac-wrapper.sh
	
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./root/etc/config/esim $(1)/etc/config/esim
endef

$(eval $(call BuildPackage,luci-app-esim-qr))
