-- Optional per-user keybind overrides (managed by DMS). Loaded after default binds.

local scriptsDir = "$HOME/.config/hypr/scripts"
local terminal = "uwsm app -- $TERMINAL "

-- APPS
hl.bind("SUPER + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("uwsm app -- nautilus --new-window"))

-- Brave
-- hl.bind("SUPER + W", hl.dsp.exec_cmd("LIBVA_DRIVER_NAME=iHD LIBVA_DEVICE_NAME=/dev/dri/renderD129 brave"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + E", hl.dsp.exec_cmd(scriptsDir .. "/QuickEdit.sh"))
hl.bind("SUPER + D", hl.dsp.exec_cmd(scriptsDir .. "/QuickEditDots.sh"))
hl.bind("SUPER + P", hl.dsp.exec_cmd(scriptsDir .. "/QuickScreenThings.sh"))
hl.bind("SUPER + B", hl.dsp.exec_cmd(terminal .. "-e btop"))
hl.bind("SUPER + G", hl.dsp.exec_cmd(terminal .. "-e lazydocker"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("gnome-calculator"))
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd("change-bg"))

-- WINDOW MOVEMENTS
hl.bind("SUPER + CTRL + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + CTRL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + U", hl.dsp.workspace.toggle_special("special"))
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
