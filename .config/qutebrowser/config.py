# ---------------------------------------------------
# file:     $XDG_CONFIG_HOME/qutebrowser/config.py
# author:   jason ryan - http://jasonwryan.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=python:
# ---------------------------------------------------

# general settings

# config.load_autoconfig(False)
import dracula.draw

config.load_autoconfig()
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 3,
        'horizontal': 3
    }
})

c.url.default_page = 'file:///home/vikash/.config/qutebrowser/firstpage/index.html'
c.editor.command = ["urxvt", "-title", "scratchpad", "-geometry", "86x24+40+60", "-e", "nvim", "-f", "{}"]
c.new_instance_open_target = "tab-bg"
c.input.insert_mode.auto_load = False
c.colors.webpage.darkmode.enabled = False
# c.colors.webpage.darkmode.algorithm = 'lightness-hsl'
c.colors.webpage.preferred_color_scheme = 'light'
c.prompt.filebrowser = False
c.completion.height = "30%"
c.completion.web_history.max_items = 1000
c.input.partial_timeout = 2000
c.tabs.background = True
c.tabs.favicons.show = "never"
c.tabs.title.format = "{index}:{current_title}"
c.tabs.new_position.related = "last"
c.downloads.location.directory = '/home/vikash/Downloads/qutebrowser/'
c.content.cache.size = 5242880
c.content.webgl = False
c.content.autoplay = False
c.content.geolocation = False
c.content.blocking.enabled = True
c.content.blocking.method = "hosts"
c.content.notifications.enabled = False
c.content.tls.certificate_errors = "ask-block-thirdparty"
c.hints.border = "1px solid #CCCCCC"
c.hints.mode = "number"
c.hints.chars = "123456789"
c.hints.min_chars = 2
c.keyhint.blacklist = ["*"]
c.completion.open_categories = ["bookmarks","quickmarks", "history"]
c.statusbar.widgets = ["url", "progress", "scroll"]

# searches
c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
c.url.searchengines['a'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['g'] = 'http://www.google.com/search?hl=en&source=hp&ie=ISO-8859-l&q={}'
c.url.searchengines['dt'] = 'https://www.urbandictionary.com/define.php?term={}'
c.url.searchengines['w'] = 'https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}'
c.url.searchengines['gh'] = 'https://github.com/search?q={}&type=Code'
c.url.searchengines['so'] = 'https://stackoverflow.com/search?q={}'
c.url.searchengines['ap'] = 'https://www.archlinux.org/packages/?sort=&q={}'

# fonts
c.fonts.default_family = ["DejaVu Sans Mono", "Liberation Mono"]
c.fonts.tabs.selected = "10pt DejaVu Sans Mono"
c.fonts.tabs.unselected = c.fonts.tabs.selected
c.fonts.statusbar = "10pt DejaVu Sans Mono"
c.fonts.downloads = c.fonts.statusbar 
c.fonts.prompts = c.fonts.statusbar
c.fonts.hints = "13px Noto Sans Mono"
c.fonts.messages.info = "7pt Noto Sans Mono"
c.fonts.keyhint = c.fonts.messages.info
c.fonts.messages.warning = c.fonts.messages.info
c.fonts.messages.error = c.fonts.messages.info
c.fonts.completion.entry = c.fonts.statusbar
c.fonts.completion.category = c.fonts.statusbar

# keybinds
config.unbind('gb', mode='normal')
config.unbind('M', mode='normal')
config.unbind('q', mode='normal')
config.unbind('<Ctrl-B>', mode='normal')
config.bind('<Ctrl-r>', 'restart', mode='normal')
config.bind('<Ctrl-Right>', 'tab-next', mode='normal')
config.bind('<Ctrl-Left>', 'tab-prev', mode='normal')
config.bind('<Ctrl-Shift-Right>', 'tab-move +', mode='normal')
config.bind('<Ctrl-Shift-Left>', 'tab-move -', mode='normal')
config.bind('t', 'set-cmd-text -s :open -t', mode='normal')
config.bind('<Ctrl-m>', 'set-cmd-text -s :quickmark-save', mode='normal')
config.bind('<Shift-m>', 'set-cmd-text -s :quickmark-save', mode='normal')
config.bind('<Escape>', 'mode-leave', mode='passthrough')

import subprocess
import os
from qutebrowser.api import interceptor

"""
qutebrowser settings for video
for more settings check out
https://qutebrowser.org/doc/help/settings.html
"""

# ================== Youtube Add Blocking ======================= {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
            url.host() == "www.youtube.com"
            and url.path() == "/get_video_info"
            and "&adformat=" in url.query()
            ):
        info.block()
interceptor.register(filter_yt)
# }}}

# }}}
# ====================== Special Format Yanking =========== {{{
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind("<y><o>", "yank inline [[{url}][{title}]]")
# }}}
# ====================== Open Notes From Qutebrowser ====== {{{
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
# config.bind('xg', 'config-cycle c.colors.webpage.darkmode.enabled False;; config-cycle c.colors.webpage.darkmode.enabled True')


config.bind('<z><l>', 'spawn --userscript qute-pass')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only')
config.bind('<f><p>', 'spawn --userscript password_fill')

# Bindings for cycling through CSS stylesheets from Solarized Everything CSS:
# https://github.com/alphapapa/solarized-everything-css


config.bind(',ap', 'config-cycle content.user_stylesheets /home/vikash/.config/qutebrowser/solarized-everything-css/css/apprentice/apprentice-all-sites.css ""')
config.bind(',dr', 'config-cycle content.user_stylesheets /home/vikash/.config/qutebrowser/solarized-everything-css/css/darculized/darculized-all-sites.css ""')
config.bind(',gr', 'config-cycle content.user_stylesheets /home/vikash/.config/qutebrowser/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""')
config.bind(',sd', 'config-cycle content.user_stylesheets /home/vikash/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ""')
config.bind(',sl', 'config-cycle content.user_stylesheets /home/vikash/.config/qutebrowser/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css ""')

