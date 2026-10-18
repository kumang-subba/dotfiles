hl.workspace_rule({ workspace = "special:alacritty" })
hl.workspace_rule({ workspace = "special:emacs" })

hl.window_rule({
	match = { title = "^Alacritty Special Workspace$" },
	workspace = "special:alacritty",
})

hl.window_rule({
	match = { class = "^Alacritty$" },
	float = true,
	opacity = "0.9 0.8",
	rounding = 20,
	size = { "(monitor_w*0.85)", "(monitor_h*0.85)" },
})

hl.window_rule({
	match = { class = "^Emacs$" },
	float = true,
	opacity = "0.9 0.8",
	rounding = 20,
	size = { "(monitor_w*0.85)", "(monitor_h*0.85)" },
	workspace = "special:emacs",
})

hl.window_rule({
	match = { class = "^com.gabm.satty$" },
	float = true,
	rounding = 20,
	size = { "(monitor_w*0.85)", "(monitor_h*0.85)" },
})

hl.window_rule({
	match = { class = "^imv$" },
	float = true,
	rounding = 20,
	size = { "(monitor_w*0.85)", "(monitor_h*0.85)" },
})
