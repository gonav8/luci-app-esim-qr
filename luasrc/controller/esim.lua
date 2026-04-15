module("luci.controller.esim", package.seeall)

function index()
    -- Main menu under Network
    entry({"admin", "network", "esim"}, alias("admin", "network", "esim", "list"), _("eSIM Manager"), 90)
    
    -- Sub-menus
    entry({"admin", "network", "esim", "list"}, cbi("esim/list"), _("Profile List"), 10)
    entry({"admin", "network", "esim", "upload"}, cbi("esim/upload"), _("QR Upload"), 20)
    entry({"admin", "network", "esim", "usage"}, cbi("esim/usage"), _("Data Usage"), 30)
    
    -- API for AJAX actions
    entry({"admin", "network", "esim", "action"}, call("action_lpac"), nil).leaf = true
end

function action_lpac()
    local action = luci.http.formvalue("action")
    local iccid = luci.http.formvalue("iccid")
    local cmd = ""
    
    if action == "enable" then
        cmd = "/usr/lib/luci/luci-app-esim-qr/lpac-wrapper.sh profile enable " .. iccid
    elseif action == "disable" then
        cmd = "/usr/lib/luci/luci-app-esim-qr/lpac-wrapper.sh profile disable " .. iccid
    elseif action == "delete" then
        cmd = "/usr/lib/luci/luci-app-esim-qr/lpac-wrapper.sh profile delete " .. iccid
    end
    
    if cmd ~= "" then
        local res = luci.sys.exec(cmd)
        luci.http.prepare_content("application/json")
        luci.http.write(res)
    end
end
