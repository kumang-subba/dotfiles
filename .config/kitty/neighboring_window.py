font_family             JetBrainsMono Nerd Font
font_size               14.0
modify_font             underline_position 3
modify_font             underline_thickness 200%

cursor_blink_interval   0
shell_integration       no-cursor

remember_window_size    no
initial_window_width    1843
initial_window_height   900
enabled_layouts         fat:bias=80;full_size=1
placement_strategy      center
hide_window_decorations yes
background_opacity      0.9
window_margin_width     8
window_margin_height    2 0
window_padding_width    10

dynamic_background_opacity    yes

# MAPS
map ctrl+t              launch --cwd=current
map ctrl+shift+t        new_tab_with_cwd
map ctrl+[              previous_window
map ctrl+]              next_window
map ctrl+x              close_window
map ctrl+left           resize_window narrower
map ctrl+right          resize_window wider
map ctrl+shift+up       resize_window taller 3
map ctrl+shift+down     resize_window shorter 3
map ctrl+shift+j        scroll_line_down
map ctrl+shift+k        scroll_line_up
map ctrl+shift+r        no_op
map ctrl+shift+e        no_op
map ctrl+shift+d        set_background_opacity +0.1
map ctrl+shift+b        set_background_opacity -0.1

# The basic colors
foreground              #cdd6f4
background              #1e1e2e
selection_foreground    #1e1e2e
selection_background    #f5e0dc

# Cursor colors
cursor                  #f5e0dc
cursor_text_color       #1e1e2e

# URL underline color when hovering with mouse
url_color               #f5e0dc

# Kitty window border colors
active_border_color     #b4befe
inactive_border_color   #6c7086
bell_border_color       #f9e2af

# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

# Tab bar colors
active_tab_foreground   #11111b
active_tab_background   #cba6f7
inactive_tab_foreground #cdd6f4
inactive_tab_background #181825
# tab_bar_background      #11111b

# Colors for marks (marked text in the terminal)
mark1_foreground #1e1e2e
mark1_background #b4befe
mark2_foreground #1e1e2e
mark2_background #cba6f7
mark3_foreground #1e1e2e
mark3_background #74c7ec

# The 16 terminal colors

# black
color0 #45475a
color8 #585b70

# red
color1 #f38ba8
color9 #f38ba8

# green
color2  #a6e3a1
color10 #a6e3a1

# yellow
color3  #f9e2af
color11 #f9e2af

# blue
color4  #89b4fa
color12 #89b4fa

# magenta
color5  #f5c2e7
color13 #f5c2e7

# cyan
color6  #94e2d5
color14 #94e2d5

# white
color7  #bac2de
color15 #a6adc8

# Tab bar
tab_bar_edge                  bottom
tab_bar_align                 left
tab_bar_style                 custom
tab_bar_min_tabs              1
tab_activity_symbol           none
bell_on_tab                   no
tab_separator                 ""
tab_bar_margin_width          0.0
tab_bar_margin_height         0.0 0.0
tab_title_template            "{title.split('/')[-1]}"
active_tab_font_style         bold

# Smart splits for neovim
map ctrl+j neighboring_window down
map ctrl+k neighboring_window up
map ctrl+h neighboring_window left
map ctrl+l neighboring_window right

# Unset the mapping to pass the keys to neovim
map --when-focus-on var:IS_NVIM ctrl+j
map --when-focus-on var:IS_NVIM ctrl+k
map --when-focus-on var:IS_NVIM ctrl+h
map --when-focus-on var:IS_NVIM ctrl+l

# the 3 here is the resize amount, adjust as needed
map alt+j kitten relative_resize.py down  3
map alt+k kitten relative_resize.py up    3
map alt+h kitten relative_resize.py left  3
map alt+l kitten relative_resize.py right 3

map --when-focus-on var:IS_NVIM alt+j
map --when-focus-on var:IS_NVIM alt+k
map --when-focus-on var:IS_NVIM alt+h
map --when-focus-on var:IS_NVIM alt+l

allow_remote_control yes
listen_on unix:@mykitty
