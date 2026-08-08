-- Per-output monitor rules — embedded sibling of the legacy outputs.conf fragment. Deploy writes ~/.config/hypr/dms/outputs.lua

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@144", position = "auto", scale = 1 })
