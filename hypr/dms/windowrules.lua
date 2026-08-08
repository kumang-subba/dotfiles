-- Window rules. Deploy writes ~/.config/hypr/dms/windowrules.lua

hl.window_rule({ match = { class = ".*(Steam)$" }, workspace = "5" })
hl.window_rule({ match = { class = ".*(Lutris)$" }, workspace = "5" })
hl.window_rule({ match = { class = ".*(Slack)$" }, workspace = "5" })
hl.window_rule({ match = { class = ".*(Discord)$" }, workspace = "6" })
hl.window_rule({ match = { class = ".*(Webcord)$" }, workspace = "6" })

local dynamic_opactiy = hl.window_rule({
	name = "dynamic_opactiy",
	match = { class = ".*" },
	opacity = "0.95 override 0.85 override",
})

hl.bind("SUPER + BACKSPACE", function()
	if dynamic_opactiy:is_enabled() == true then
		dynamic_opactiy:set_enabled(false)
	else
		dynamic_opactiy:set_enabled(true)
	end
end)
