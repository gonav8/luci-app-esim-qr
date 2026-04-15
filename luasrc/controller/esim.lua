module("luci.controller.esim", package.seeall)

function index()
    entry({"admin", "network", "esim"}, cbi("esim"), _("eSIM QR Upload"), 90)
end
