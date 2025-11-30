# pylint: disable=C0111
# =============================================
# qutebrowser config.py – Yamisheta (2025)
# Καθαρισμένο, οργανωμένο, με σχόλια στα Ελληνικά
# =============================================

config.load_autoconfig(False)

# ================== Βασικές Ρυθμίσεις ==================
c.qt.highdpi = True
c.auto_save.session = True
c.confirm_quit = ["downloads"]

# ================== Editor για Text Fields ==================
c.editor.command = ['ghostty', '-e', 'nvim', '{file}']

# ================== Aliases (Shortcuts για Commands) ==================
c.aliases = {
    'w': 'session-save',
    'q': 'close',
    'qa': 'quit',
    'wq': 'quit --save',
}

# ================== Επιδόσεις & Hardware Acceleration ==================
c.qt.args += [
    "ignore-gpu-blocklist",
    "enable-gpu-rasterization",
    "enable-zero-copy",
    "disable-gpu-driver-bug-workarounds",
]

# ================== DRM / Widevine (Netflix, Spotify, Disney+) ==================
# Το DRM λειτουργεί αυτόματα στις περισσότερες διανομές
# Αν δεν δουλεύει, εγκατέστησε: sudo pacman -S qt6-webengine-widevine (ή qt5-webengine-widevine)

# ================== Adblocking (uBlock Origin-level) - Ανανεωμένο 2025 ==================
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
    # 🔥 Core uBlock Origin lists (2025 - Official & Updated)
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/quick-fixes.txt",

    # 📢 Ads & Tracking (Industry Standard - Updated 2025)
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=0",

    # 🍪 Cookie Banners & Annoyances (2025 Best)
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",

    # 🛡️ Security & Malware (2025)
    "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-online.txt",
    "https://malware-filter.gitlab.io/malware-filter/phishing-filter.txt",

    # 🇬🇷 Greek-specific
    "https://raw.githubusercontent.com/kargig/greek-adblockplus-filter/master/void-gr-filters.txt",

    # 💎 Extra Protection
    "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt",
    "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt",
]
config.bind('B', 'adblock-update')

# ================== Greasemonkey (Userscripts) ==================
c.content.javascript.enabled = True

# ================== Περιεχόμενο & Συμπεριφορά ==================
c.content.pdfjs = True
c.content.autoplay = True
c.scrolling.smooth = True
c.zoom.default = "100%"
c.tabs.background = True

# ================== Encoding & Ελληνικά ==================
c.content.default_encoding = 'utf-8'
c.content.headers.accept_language = 'el-GR,el;q=0.9,en-US;q=0.8,en;q=0.7'

# ================== Spell Checking (Ορθογραφικός Έλεγχος) ==================
# c.spellcheck.languages = ['el-GR', 'en-US']

# ================== Downloads ==================
c.downloads.location.directory = '~/Downloads'
c.downloads.location.prompt = True
c.downloads.location.suggestion = 'both'
c.downloads.open_dispatcher = "xdg-open"

# ================== Εμφάνιση & Γραμματοσειρές ==================
c.tabs.show = 'always'
c.tabs.position = 'bottom'
c.tabs.width = '7%'
c.tabs.indicator.width = 0
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.select_on_remove = 'last-used'
c.tabs.new_position.related = 'next'
c.tabs.new_position.unrelated = 'last'

c.statusbar.show = "in-mode"
c.statusbar.position = 'bottom'
c.statusbar.widgets = ["url"]

c.fileselect.handler = 'default'

c.fonts.default_size = '11pt'
c.fonts.default_family = ['CaskaydiaCove Nerd Font', 'monospace']
c.fonts.web.size.default = 16
c.fonts.web.family.fixed = 'CaskaydiaCove Nerd Font'
c.fonts.web.family.sans_serif = 'CaskaydiaCove Nerd Font'
c.fonts.web.family.serif = 'CaskaydiaCove Nerd Font'
c.fonts.web.family.standard = 'CaskaydiaCove Nerd Font'

# ================== Dark Mode ==================
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.policy.page = 'always'
c.colors.webpage.darkmode.policy.images = 'never'

# ================== Hints (f για follow) ==================
c.hints.chars = "aoeuidhtns"
c.hints.mode = "letter"
c.hints.uppercase = False

# ================== Privacy ==================
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.store", True)
c.content.notifications.enabled = False

# ================== Εξαιρέσεις για DevTools & qute:// ==================
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# ================== User-Agent Spoofing ==================
config.set('content.headers.user_agent',
           'Mozilla/5.0 ({os_info}; rv:144.0) Gecko/20100101 Firefox/144.0',
           'https://accounts.google.com/*')
config.set('content.headers.user_agent',
           'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) '
           '{qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}',
           'https://gitlab.gnome.org/*')

# ================== Userscripts ==================
import os
userscripts_path = f'file://{os.path.expanduser("~/.local/share/qutebrowser/userscripts/*")}'
config.set('content.local_content_can_access_remote_urls', True, userscripts_path)
config.set('content.local_content_can_access_file_urls', False, userscripts_path)

# ================== Αρχική σελίδα & Search Engines ==================
bookmarks_path = f'file://{os.path.expanduser("~/.config/qutebrowser/bookmarks.html")}'
c.url.start_pages = [bookmarks_path]
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'you': 'https://www.youtube.com/results?search_query={}',
    'git':  'https://github.com/search?o=desc&q={}&s=stars',
}

# ================== Completion Settings (Autocomplete) ==================
c.completion.height = '30%'
c.completion.quick = True
c.completion.show = 'auto'

# ================== Input Mode Settings ==================
c.input.insert_mode.auto_load = True
c.input.insert_mode.auto_leave = True
c.input.partial_timeout = 2000

# ================== Keybindings ==================
config.bind('gd', 'download')
config.bind('gC', 'download-clear')
config.bind('gc', 'download-cancel ;; download-delete')

config.bind('k', 'scroll down')
config.bind('j', 'scroll up')
config.bind('h', 'tab-prev')
config.bind('l', 'tab-next')
config.bind(',', 'back')
config.bind('.', 'forward')

config.bind('<Ctrl+Tab>', 'tab-next')
config.bind('<Ctrl+Shift+Tab>', 'tab-prev')
config.bind('q', 'tab-close')
config.bind('d', 'tab-close')
config.bind('U', 'undo')
config.bind('t', f'open -t {bookmarks_path}')
config.bind('H', 'history')

config.bind('h', 'open -t https://www.google.com')
config.bind('o', 'cmd-set-text :open -t')
config.bind('O', 'cmd-set-text :open')
config.bind('I', 'cmd-set-text :open {url}')

config.bind('<Ctrl+f>', 'set-cmd-text /')

config.bind('y', 'yank selection --quiet')
config.bind('cc', 'yank url --quiet')
config.bind('p', 'insert-text {clipboard}')
config.bind('P', 'open -t -- {primary}')

config.bind('sb', 'config-cycle statusbar.show always never')
config.bind('st', 'config-cycle tabs.show always never')

config.bind('F', 'fullscreen toggle')
config.bind('m', 'tab-mute')
config.bind('R', 'reload -f')
config.bind('df', 'view-source')
config.bind('v', 'spawn --userscript view_in_mpv')

config.bind('<Escape>', 'mode-leave', mode='insert')
config.bind('<Escape>', 'mode-leave', mode='caret')
config.bind('<Escape>', 'mode-leave', mode='passthrough')

# ================== Θέμα Catppuccin (frappe) ==================
import catppuccin
catppuccin.setup(c, 'frappe', True)

c.colors.statusbar.insert.bg = '#ca9ee6'
c.colors.statusbar.insert.fg = '#303446'

c.colors.statusbar.url.fg = '#303446'
c.colors.statusbar.url.success.https.fg = '#303446'
c.colors.statusbar.url.success.http.fg = '#e5c890'
c.colors.statusbar.url.error.fg = '#e78284'
c.colors.statusbar.url.hover.fg = '#99d1db'
c.colors.statusbar.url.warn.fg = '#ef9f76'
