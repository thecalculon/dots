
from libqtile import  qtile, widget
from colors import color_schema
MYFONT = "Hack Nerd Font"

widgets = [

	widget.Sep(
        foreground=color_schema['fg'],
        background=color_schema['bg'],
        # foreground = colours[2],
        linewidth = 0,
        padding = 10,
	),
	widget.TextBox(
            foreground=color_schema['dark-blue'],
            background=color_schema['bg'],
            fontsize = 20,
            text = ' ',
            ),
	widget.Sep(
        foreground=color_schema['fg'],
        background=color_schema['bg'],
        # foreground = colours[2],
        linewidth = 0,
        padding = 2,
	),
	widget.GroupBox(
            font=MYFONT,
            fontsize=14,
            spacing=0,
            disable_drag=True,
            active=color_schema['fg'],
            rounded=True,
            highlight_method="text",
            this_current_screen_border=color_schema['dark-yellow'],
            foreground=color_schema['fg'],
            background=color_schema['bg'],
            urgent_text = color_schema['dark-yellow'],
            invert_mouse_wheel = True,
            margin = 2,
            padding = 0,
            urgent_alert_method = 'text',
	),
    widget.Sep(
        foreground=color_schema['fg'],
        background=color_schema['bg'],
        # foreground = colours[2],
        linewidth = 0,
        padding = 10,
        ),
	widget.CurrentLayoutIcon(
        foreground=color_schema['dark-red'],
        # max_chars = 3,
        # padding = 0
	),
    widget.Spacer(),
	widget.Clock( 
              foreground =color_schema['dark-blue'],
              background =color_schema['bg'],
              format = '  %d/%m  %H:%M '
              ),
    widget.Spacer(),
    widget.Systray(
            foreground =color_schema['fg'],
            background =color_schema['bg'],
            icon_size = 14,
            padding = 4,
            ),
	widget.Sep(
            foreground=color_schema['fg'],
            background=color_schema['bg'],
            linewidth = 0,
            padding = 10,
	),
	widget.Volume(
            foreground=color_schema['fg'],
            background=color_schema['bg'],
            emoji = True,
            # fmt = {"%0.2f"},
            # foreground = colours[6],
            mouse_callbacks = {"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
            step = 5,
	),
	# widget.TextBox(
            # foreground=color_schema['fg'],
            # background=color_schema['bg'],
            # # foreground = colours[6],
            # font =  MYFONT,
            # fontsize = 17,
            # mouse_callbacks = ({
                # "Button1": lambda: qtile.cmd_spawn("amixer -M set Master toggle"),
                # "Button3": lambda: qtile.cmd_spawn("pavucontrol"),
                # "Button4": lambda: qtile.cmd_spawn("amixer -M set Master 5%+ unmute"),
                # "Button5": lambda: qtile.cmd_spawn("amixer -M set Master 5%- unmute"),
                # }),
            # padding = 2,
            # text = '墳 ',
	# ),
	widget.Volume(
            foreground=color_schema['fg'],
            background=color_schema['bg'],
            # emoji = True,
            # fmt = {"%0.2f"},
            # foreground = colours[6],
            mouse_callbacks = {"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
            step = 5,
	),
	widget.Sep(
            foreground=color_schema['fg'],
            background=color_schema['bg'],
            # foreground = colours[2],
            linewidth = 0,
            padding = 10,
	),
	widget.BatteryIcon(
            foreground=color_schema['fg'],
            background=color_schema['bg'],
	),
  widget.Battery(
            foreground=color_schema['fg'],
            background=color_schema['bg'],
            low_foreground = color_schema['dark-red'],
            format = '{percent:2.0%}',
            low_percentage = 0.2,
            notify_below = 20,
	),
	widget.Sep(
            foreground=color_schema['fg'],
            background=color_schema['bg'],
            # foreground = colours[2],
            linewidth = 0,
            padding = 20,
	),

]


