local json = require "luci.jsonc"

m = Map("esim", "eSIM Profile Manager")

s = m:section(TypedSection, "general", "Current eSIM Profiles")
s.anonymous = true
s.template = "esim/profile_list"

return m
