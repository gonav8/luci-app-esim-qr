m = Map("esim", "eSIM Profile Manager (QR Upload)")

s = m:section(TypedSection, "general", "Upload eSIM QR Code")
s.anonymous = true

o = s:option(FileUpload, "qrfile", "Select QR Code Image")
o.optional = false

btn = s:option(Button, "upload", "Upload & Add Profile")
btn.inputstyle = "apply"
function btn.write(self, section)
    local file = luci.http.formvalue("cbid.esim.general.qrfile")
    if file then
        luci.sys.call("/usr/lib/luci/luci-app-esim-qr/qr-upload.sh " .. file)
        luci.http.redirect(luci.dispatcher.build_url("admin/network/esim"))
    end
end

return m
