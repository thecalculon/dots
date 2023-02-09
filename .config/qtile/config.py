import os
import re
import socket
import subprocess
from libqtile import bar, hook, layout, qtile
from libqtile.config import EzClick as Click, EzDrag as Drag, EzKey as Key, Group, Match, Screen
from libqtile.lazy import lazy
from typing import List
from widgets import widgets
from colors import color_schema

mod = "mod4"
MYFONT = "Hack Nerd Font"
myTerm = "alacritty"
myBrowser = "qutebrowser"
myConfig = "~/.config/qtile/config.py"
myFileManager = "pcmanfm"
myPDFReader = "zathura"
myTextEditor = "emacs"

keys = [
	# Qtile Controls
	Key("M-C-r", lazy.restart()),
	Key("M-C-q", lazy.shutdown()),

	# Window and Layout Controls

	Key("M-j", lazy.layout.up()),
	Key("M-S-k", lazy.layout.shuffle_down()),
	Key("M-S-j", lazy.layout.shuffle_up()),
	Key("M-<space>", lazy.layout.next()),
	Key("M-S-f", lazy.layout.flip()),
	Key("M-S-l", lazy.layout.grow()),
	Key("M-l", lazy.layout.grow_main()),
	Key("M-S-h", lazy.layout.shrink()),
	Key("M-h", lazy.layout.shrink_main()),
	Key("M-n", lazy.layout.normalize()),
	Key("M-<Tab>", lazy.next_layout()),
	Key("M-q", lazy.window.kill()),
	Key("M-f", lazy.window.toggle_floating()),
	Key("M-s", lazy.window.toggle_fullscreen()),
	Key("M-<period>", lazy.next_screen()),
	Key("M-<comma>", lazy.prev_screen()),
	Key("M-b", lazy.hide_show_bar()),

	# System Controls
	Key("<XF86AudioLowerVolume>", lazy.spawn("amixer -M set Master 5%- unmute")),
	Key("<XF86AudioRaiseVolume>", lazy.spawn("amixer -M set Master 5%+ unmute")),
	Key("<XF86AudioMute>", lazy.spawn("amixer -M set Master toggle")),
	Key("<XF86MonBrightnessDown>", lazy.spawn("brightnessctl set 10%-")),
	Key("<XF86MonBrightnessUp>", lazy.spawn("brightnessctl set 10%+")),
	Key("A-j", lazy.spawn("brightnessctl set 10%-")),
	Key("A-k", lazy.spawn("brightnessctl set 10%+")),

	# Applications launcher
	Key("M-d", lazy.spawn("/home/vikash/.config/rofi/bin/launcher_ribbon")),
	# Key("M-d", lazy.spawn("dmenu_run -b -l 10 -fn 'Source Code Pro SemiBold'")),
	# Key("M-w", lazy.spawn("rofi -show window")),
	Key("M-e", lazy.spawn(myBrowser)),
	Key("M-A-i", lazy.spawn(myFileManager)),
	Key("M-A-p", lazy.spawn(myPDFReader)),
	Key("M-<Return>", lazy.spawn(myTerm)),
	Key("M-A-t", lazy.spawn(myTextEditor)),
]
# GROUPS
groups = (
    Group(' ', layout='monadtall'),
    Group(' ', layout='monadtall'),
    Group(' ', layout='monadtall'),
    Group(' ', layout='floating'),
    Group(' ', layout='floating'),
    Group(' ', layout='floating'),
    # Group('7:  ', layout='floating'),
    # Group('8:  ', layout='floating'),
    # Group('9:  ', layout='floating')
)

for k, group in zip(["1", "2", "3", "4", "5", "6"], groups):
	keys.append(Key("M-"+(k), lazy.group[group.name].toscreen()))			# Send current window to another group
	keys.append(Key("M-S-"+(k), lazy.window.togroup(group.name)))	# Send current window to another group


layout_theme = {"border_focus": color_schema['red'],
				"border_normal": color_schema['yellow'],
				"margin": 6,
				"border_width": 3
}

layouts = [
	# layout.Bsp(**layout_theme),
	#layout.Columns(**layout_theme),
	#layout.Matrix(**layout_theme),
	#layout.MonadWide(**layout_theme),
	#layout.RatioTile(**layout_theme),
	#layout.Slice(**layout_theme),
	layout.Stack(num_stacks=1),
	#layout.Stack(stacks=1, **layout_theme),
	#layout.Tile(shift_windows=True, **layout_theme),
	#layout.VerticalTile(**layout_theme),
	#layout.Zoomy(**layout_theme),
	layout.Floating(**layout_theme),
	layout.Max(**layout_theme),
	layout.MonadTall(**layout_theme),
    layout.TreeTab(**layout_theme)
]



prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
	background = color_schema['bg'],
	foreground = color_schema['fg'],
	font = "SF Pro Text Regular",
	fontsize = 14,
	padding = 2
)
extension_defaults = widget_defaults.copy()

status_bar = lambda widgets: bar.Bar(widgets, 24, opacity=0.8, margin=[5,120,0,120])

if qtile.core.name == "x11":
    screens = [
        Screen(top=status_bar(widgets),
               wallpaper='/home/vikash/.wallpapers/ign_cityRainOther.png',
               wallpaper_mode='fill'
               ),
        ]

elif qtile.core.name == "wayland":
    screens = [
        Screen(top=status_bar(widgets),
               wallpaper='/home/vikash/.wallpapers/ign_cityRainOther.png',
               wallpaper_mode='fill'
               ),
        ]
    connected_monitors = len(qtile.core.outputs)
# logger.warning(f"Found {connected_monitors} monitor(s)")

    if connected_monitors > 1:
        for _ in range(1, connected_monitors):
            screens.append(Screen(top=status_bar(widgets), 
                            wallpaper='/home/vikash/.wallpapers/ign_cityRainOther.png', 
                            wallpaper_mode='fill'), )
mouse = [
	Drag("M-1", lazy.window.set_position_floating(),
		start = lazy.window.get_position()),
	Drag("M-3", lazy.window.set_size_floating(),
		start  = lazy.window.get_size()),
	Click("M-2", lazy.window.bring_to_front())
]

auto_fullscreen = True
auto_minimize = True
bring_front_click = False
cursor_warp = False
dgroups_app_rules = []  # type: List
dgroups_key_binder = None
floating_layout = layout.Floating(**layout_theme,
	float_rules=[
		*layout.Floating.default_float_rules,
		Match(title='Authentication'),
		Match(title='branchdialog'),
		Match(title='pinentry'),
		Match(wm_class='confirmreset'),
		Match(wm_class='makebranch'),
		Match(wm_class='maketag'),
		Match(wm_class='ssh-askpass'),
])
focus_on_window_activation = "smart"
follow_mouse_focus = True
reconfigure_screens = True

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(wm_class='Pcmanfm'), # file manager
    Match(wm_class='Xephyr'), # xephyr
    Match(wm_class='gnuplot'), # gnuplot 
    Match(wm_class='matplotlib'), # gnuplot 
    Match(wm_class='gnuplot_qt'), # file manager
    Match(wm_class='eog'), # file manager
    Match(wm_class='gksqt'), # file manager
    Match(wm_class='pinentry-gtk-2'), # GPG key password entry
])

auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup
def autostart():
    # qtile.cmd_hide_show_bar('all')
    home = os.path.expanduser('/home/vikash/.config/qtile/autostart.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.

wmname = "LG3D"
