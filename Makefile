include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-esim-qr
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPL-2.0
PKG_MAINTAINER:=Your Name <you@email.com>

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-esim-qr
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=eSIM QR Upload for lpac (Quectel RM520N-EU)
  DEPENDS:=+lpac +zbar-tools +libcurl
  PKGARCH:=all
endef

define Package/luci-app-esim-qr/description
  Simple LuCI page to upload eSIM QR code image, decode with zbar, and add profile via lpac.
  Perfect for 5G travel router with no physical SIM.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-esim-qr/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./luasrc/controller/esim.lua $(1)/usr/lib/lua/luci/controller/esim.lua
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./luasrc/model/cbi/esim.lua $(1)/usr/lib/lua/luci/model/cbi/esim.lua
	
	$(INSTALL_DIR) $(1)/usr/lib/luci/luci-app-esim-qr
	$(INSTALL_BIN) ./root/usr/lib/luci/luci-app-esim-qr/qr-upload.sh $(1)/usr/lib/luci/luci-app-esim-qr/qr-upload.sh
	
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./root/etc/config/esim $(1)/etc/config/esim
endef

$(eval $(call BuildPackage,luci-app-esim-qr))
