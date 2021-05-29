import os
import re
import socket
import subprocess
from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import EzClick as Click, EzDrag as Drag, EzKey as Key, Group, Match, Screen
from libqtile.config import ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List

mod = "mod4"
MYFONT = "Hack Nerd Font"
myTerm = "kitty"
myBrowser = "google-chrome-stable"
myConfig = "~/.config/qtile/config.py"
myFileManager = "pcmanfm"
myPDFReader = "zathura"
myTextEditor = "emacs"

BLACK = '#29414f'
RED = '#ec5f67'
GREEN = '#99c794'
YELLOW = '#fac863'
BLUE = '#6699cc'
MAGENTA = '#c594c5'
CYAN = '#5fb3b3'
WHITE = '#ffffff'


keys = [
	# Qtile Controls
	Key("M-C-r", lazy.restart()),
	Key("M-C-q", lazy.shutdown()),

	# Window and Layout Controls
	Key("M-k", lazy.layout.down()),
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
	Key("M-S-q", lazy.window.kill()),
	Key("M-f", lazy.window.toggle_floating()),
	Key("M-s", lazy.window.toggle_fullscreen()),
	Key("M-<period>", lazy.next_screen()),
	Key("M-<comma>", lazy.prev_screen()),

	# System Controls
	Key("<XF86AudioLowerVolume>", lazy.spawn("amixer -M set Master 5%- unmute")),
	Key("<XF86AudioRaiseVolume>", lazy.spawn("amixer -M set Master 5%+ unmute")),
	Key("<XF86AudioMute>", lazy.spawn("amixer -M set Master toggle")),
	Key("<XF86MonBrightnessDown>", lazy.spawn("brightnessctl set 10%-")),
	Key("<XF86MonBrightnessUp>", lazy.spawn("brightnessctl set 10%+")),
	Key("A-j", lazy.spawn("brightnessctl set 10%-")),
	Key("A-k", lazy.spawn("brightnessctl set 10%+")),

	# Applications launcher
	Key("M-d", lazy.spawn("dmenu_run")),
	Key("M-A-i", lazy.spawn(myBrowser)),
	Key("M-e", lazy.spawn(myFileManager)),
	Key("M-A-p", lazy.spawn(myPDFReader)),
	Key("M-<Return>", lazy.spawn(myTerm)),
	Key("M-A-t", lazy.spawn(myTextEditor)),
]
# GROUPS
groups = (
    Group('1:  ', layout='monadtall'),
    Group('2:  ', layout='max'),
    Group('3:  ', layout='monadtall'),
    Group('4:  ', layout='floating'),
    Group('5:  ', layout='floating'),
    Group('6:  ', layout='floating'),
    Group('7:  ', layout='floating'),
    Group('8:  ', layout='floating'),
    Group('9:  ', layout='floating')
)

for k, group in zip(["1", "2", "3", "4", "5", "6", "7", "8", "9"], groups):
	keys.append(Key("M-"+(k), lazy.group[group.name].toscreen()))			# Send current window to another group
	keys.append(Key("M-S-"+(k), lazy.window.togroup(group.name)))	# Send current window to another group


layout_theme = {"border_focus": GREEN,
				"border_normal": BLACK,
				"margin": 5,
				"border_width": 2
}

layouts = [
	#layout.Bsp(**layout_theme),
	layout.Columns(**layout_theme),
	#layout.Matrix(**layout_theme),
	#layout.MonadWide(**layout_theme),
	#layout.RatioTile(**layout_theme),
	#layout.Slice(**layout_theme),
	#layout.Stack(num_stacks=2),
	#layout.Stack(stacks=2, **layout_theme),
	#layout.Tile(shift_windows=True, **layout_theme),
	#layout.VerticalTile(**layout_theme),
	#layout.Zoomy(**layout_theme),
	layout.Floating(**layout_theme),
	layout.Max(**layout_theme),
	layout.MonadTall(**layout_theme)
]

colours = [["#141414", "#141414"], # Background
		   ["#FFFFFF", "#FFFFFF"], # Foreground
		   ["#ABB2BF", "#ABB2BF"], # Grey Colour
		   ["#E35374", "#E35374"],
		   ["#89CA78", "#89CA78"],
		   ["#F0C674", "#F0C674"],
		   ["#61AFEF", "#61AFEF"],
		   ["#D55FDE", "#D55FDE"],
		   ["#2BBAC5", "#2BBAC5"]]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
	background = colours[0],
	foreground = colours[1],
	font = "SF Pro Text Regular",
	fontsize = 13,
	padding = 1
)
extension_defaults = widget_defaults.copy()

widgets = [
	widget.Image(
            foreground=WHITE,
            background=BLACK,
		filename = "~/.config/qtile/py.png",
		mouse_callbacks = {"Button1": lambda: qtile.cmd_spawn("dmenu_run")},
		scale = True,
	),
	widget.Sep(
            foreground=WHITE,
            background=BLACK,
		# foreground = colours[2],
		linewidth = 0,
		padding = 5,
	),
	widget.GroupBox(
            font=MYFONT,
            fontsize=13,
            spacing=0,
            disable_drag=True,
            active=MAGENTA,
            inactive=WHITE,
            rounded=False,
            highlight_method="block",
            this_current_screen_border=GREEN,
            this_screen_border=CYAN,
            other_current_screen_border=BLACK,
            other_screen_border=BLACK,
            foreground=WHITE,
            background=BLACK,
            urgent_text = colours[3],
            invert_mouse_wheel = True,
            margin = 2,
            padding = 0,
            urgent_alert_method = 'text',
	),
	widget.Sep(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[2],
		linewidth = 0,
		padding = 10,
	),
	widget.CurrentLayout(
                foreground=RED,
                background=BLACK,
		font = "SF Pro Text Semibold",
	),
	widget.Sep(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[2],
		linewidth = 0,
		padding = 10,
	),
	widget.WindowName(
                foreground=WHITE,
                background=BLACK,
		max_chars = 75,
	),
	widget.Systray(
                foreground=WHITE,
                background=BLACK,
		icon_size = 14,
		padding = 4,
	),
	widget.Sep(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[2],
		linewidth = 0,
		padding = 10,
	),
	widget.TextBox(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[6],
		font =  MYFONT,
		fontsize = 14,
		mouse_callbacks = ({
			"Button1": lambda: qtile.cmd_spawn("amixer -M set Master toggle"),
			"Button3": lambda: qtile.cmd_spawn("pavucontrol"),
			"Button4": lambda: qtile.cmd_spawn("amixer -M set Master 5%+ unmute"),
			"Button5": lambda: qtile.cmd_spawn("amixer -M set Master 5%- unmute"),
		}),
		padding = 0,
		text = '墳 ',
	),
	widget.Volume(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[6],
		mouse_callbacks = {"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
		step = 5,
	),
	widget.Sep(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[2],
		linewidth = 0,
		padding = 10,
	),
	#widget.TextBox(
	#	foreground = colours[7],
	#	font = "JetBrainsMono Nerd Font Regular",
	#	fontsize = 14,
	#	padding = 0,
	#	text = '爵 ',
	#),
	#widget.Net(
	#	foreground = colours[7],
	#	format = '{down}  ',
	#	interface = 'enp1s0',
	#),
	widget.Battery(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[7],
		low_foreground = RED,
		charge_char = ' ',
		discharge_char = ' ',
		empty_char = ' ',
		full_char = ' ',
		unknown_char = ' ',
		font = "JetBrainsMono Nerd Font Regular",
		fontsize = 14,
		format = '{char}',
		low_percentage = 0.2,
		padding = 0,
		show_short_text = False,
	),
	widget.Battery(
                foreground=WHITE,
                background=BLACK,
                # foreground=WHITE,
                # background=GREEN,
		# foreground = colours[7],
		low_foreground = RED,
		format = '{percent:2.0%}',
		low_percentage = 0.2,
		notify_below = 20,
	),
	widget.Sep(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[2],
		linewidth = 0,
		padding = 5,
	),
	widget.TextBox(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[8],
		font = MYFONT,
		fontsize = 14,
		padding = 0,
		text = ' ',
	),
	widget.Clock(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[8],
		format = '%d/%m  %H:%M ',
	),
	widget.Sep(
                foreground=WHITE,
                background=BLACK,
		# foreground = colours[2],
		linewidth = 0,
		padding = 5,
	),
	#widget.StockTicker(
	#	apikey = 'AESKWL5CJVHHJKR5',
	#	url = 'https://www.alphavantage.co/query?'
	#),
]

status_bar = lambda widgets: bar.Bar(widgets, 18, opacity=1.0)

screens = [Screen(top=status_bar(widgets))]

connected_monitors = subprocess.run(
	"xrandr | grep 'connected' | cut -d ' ' -f 2",
	shell = True,
	stdout = subprocess.PIPE
).stdout.decode("UTF-8").split("\n")[:-1].count("connected")

if connected_monitors > 1:
	for i in range(1, connected_monitors):
		screens.append(Screen(top=status_bar(widgets)))

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

@hook.subscribe.startup_once
def autostart():
	home = os.path.expanduser('~/.config/qtile/autostart.sh')
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
