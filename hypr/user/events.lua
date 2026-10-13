hl.on("workspace.special_active", function(ws, m)
	if ws.name then
		local win = hl.get_active_window()

		if win then
			local width = math.floor(m.size.width * 0.85)
			local height = math.floor(m.size.height * 0.85)

			hl.dispatch(hl.dsp.window.resize({
				x = width,
				y = height,
				window = win,
			}))

			hl.dispatch(hl.dsp.window.center({
				window = win,
			}))
		end
	end
end)
