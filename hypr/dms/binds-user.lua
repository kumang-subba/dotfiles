-- Optional per-user keybind overrides (managed by DMS). Loaded after default binds.

local scriptsDir = "$HOME/.config/hypr/scripts"
local terminal = "uwsm app -- $TERMINAL "

-- APPS
hl.bind("SUPER + Return", function()
	local alacrity_special = hl.get_windows({ title = "Alacritty Special Workspace" })
	if #alacrity_special < 1 then
		hl.dispatch(hl.dsp.exec_cmd("uwsm app -- $TERMINAL -T 'Alacritty Special Workspace'"))
	else
		hl.dispatch(hl.dsp.workspace.toggle_special("alacritty"))
	end
end)

hl.bind("SUPER + E", function()
	local act_w = hl.get_active_window()
	local act_sw = hl.get_active_special_workspace()
	local emacs_w = hl.get_windows({ class = "Emacs" })
	if #emacs_w < 1 then
		hl.dispatch(hl.dsp.exec_cmd("emacsclient -c -a emacs"))
	else
		if act_w ~= nil and act_w.class == "Emacs" and act_sw ~= nil and act_sw.name == "special:emacs" then
			hl.dispatch(hl.dsp.workspace.toggle_special("emacs"))
		else
			hl.dispatch(hl.dsp.focus({
				window = emacs_w[1],
			}))
		end
	end
end)

hl.bind("SUPER + CTRL + E", function()
	local act_w = hl.get_active_window()
	local act_sw = hl.get_active_special_workspace()
	local emacs_w = hl.get_windows({ class = "Emacs" })
	if #emacs_w < 1 then
		hl.dispatch(hl.dsp.exec_cmd("emacsclient -c -a emacs"))
	else
		if act_w ~= nil and act_w.class == "Emacs" and act_sw == nil then
			hl.dispatch(hl.dsp.window.move({
				window = emacs_w[1],
				workspace = "special:emacs",
				follow = true,
			}))
		else
		end
	end
end)

hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + T", hl.dsp.exec_cmd("uwsm app -- nautilus --new-window"))

-- Brave
-- hl.bind("SUPER + W", hl.dsp.exec_cmd("LIBVA_DRIVER_NAME=iHD LIBVA_DEVICE_NAME=/dev/dri/renderD129 brave"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("brave"))
-- hl.bind("SUPER + D", hl.dsp.exec_cmd(scriptsDir .. "/QuickEditDots.sh"))
hl.bind("SUPER + P", hl.dsp.exec_cmd(scriptsDir .. "/QuickScreenThings.sh"))
hl.bind("SUPER + B", hl.dsp.exec_cmd(terminal .. "-e btop"))
hl.bind("SUPER + D", hl.dsp.exec_cmd(terminal .. "-e lazydocker"))
hl.bind("SUPER + G", hl.dsp.exec_cmd(scriptsDir .. "/GifWallpaper.sh"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("gnome-calculator"))
-- hl.bind("SUPER + E", hl.dsp.exec_cmd("emacsclient -c -a emacs"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("systemctl --user restart emacs.service"))
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd("change-bg"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())

-- WINDOW MOVEMENTS
hl.bind("SUPER + CTRL + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + CTRL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + S", function()
	local ws = hl.get_active_special_workspace() or hl.get_active_workspace()
	-- hl.notification.create({ text = ws.name, timeout = 15000, icon = "info", font_size = 20 })
	if ws.name:match("special") then
		local name = ws.name:gsub("^special:", "")
		hl.dispatch(hl.dsp.workspace.toggle_special(name))
	else
		local windows = hl.get_windows()
		local special_name = nil

		for _, win in pairs(windows) do
			local workspace = win.workspace
			if workspace and workspace.name:match("^special") then
				special_name = workspace.name:gsub("^special:", "")
				break
			end
		end
		hl.dispatch(hl.dsp.workspace.toggle_special(special_name or "special"))
	end
end)
hl.bind("SUPER + U", function()
	local ws = hl.get_active_special_workspace() or hl.get_active_workspace()
	if ws.name:match("special") then
		local name = ws.name:gsub("^special:", "")
		hl.dispatch(hl.dsp.workspace.toggle_special(name))
	else
		local windows = hl.get_windows()
		local special_name = nil

		for _, win in pairs(windows) do
			local workspace = win.workspace
			if workspace and workspace.name:match("^special") then
				special_name = workspace.name:gsub("^special:", "")
				break
			end
		end
		hl.dispatch(hl.dsp.workspace.toggle_special(special_name or "special"))
	end
end)
hl.bind("SUPER + CTRL + S", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + CTRL + U", hl.dsp.window.move({ workspace = "special" }))

-- === Monitor Navigation ===
hl.bind("SUPER + ALT + left", hl.dsp.focus({ monitor = "l" }))
hl.bind("SUPER + ALT + right", hl.dsp.focus({ monitor = "r" }))
hl.bind("SUPER + ALT + H", hl.dsp.focus({ monitor = "l" }))
hl.bind("SUPER + ALT + J", hl.dsp.focus({ monitor = "d" }))
hl.bind("SUPER + ALT + K", hl.dsp.focus({ monitor = "u" }))
hl.bind("SUPER + ALT + L", hl.dsp.focus({ monitor = "r" }))

-- === Manual Sizing ===
hl.bind("SUPER + SHIFT + H", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "m+1", on_current_monitor = true }))
