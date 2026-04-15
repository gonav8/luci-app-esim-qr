m = Map("esim", "Data Usage Monitor")

s = m:section(TypedSection, "general", "Usage Statistics")
s.anonymous = true

o = s:option(Value, "limit", "Monthly Data Limit (GB)")
o.datatype = "float"
o.default = "10"

o = s:option(Value, "remaining", "Remaining Data (GB)")
o.readonly = true
o.default = "N/A"

o = s:option(Button, "reset", "Reset Statistics")
o.inputstyle = "remove"

return m
