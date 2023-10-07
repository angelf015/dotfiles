from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from utils import config

mod = 'mod4'
terminal = config['terminal'].copy()

if not terminal['main']:
    terminal['main'] = guess_terminal()

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # Switch between windows in current stack pane
    ([mod], "down", lazy.layout.down()),
    ([mod], "up", lazy.layout.up()),
    ([mod], "left", lazy.layout.left()),
    ([mod], "right", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),

    ([mod], "x", lazy.spawn(".config/rofi/bin/powermenu")),
    ([mod, "shift"], "x", lazy.spawn("archlinux-logout")),

    ([mod], "p", lazy.spawn(
        "xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 "
        "--rotate normal")),
    ([mod], "o", lazy.spawn("xrandr --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal")),
    # ([mod], "y", lazy.spawn("xmodmap ~/.Xmodmap")),

    # ------------ App Configs ------------

    # Menu
    # ([mod], "m", lazy.spawn("rofi -show drun")),
    ([mod], "m", lazy.spawn(".config/rofi/bin/launcher")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn(".config/rofi/bin/launcher")),

    # File Explorer
    ([mod], "e", lazy.spawn("nemo")),

    # Terminal
    ([mod], "Return", lazy.spawn("kitty")),

    # Redshift
    # ([mod], "r", lazy.spawn("redshift -O 2400")),
    # ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # 4K Monitor
    ([mod, "shift"], "b", lazy.spawn("brave --force-device-scale-factor=1.5")),
    ([mod, "shift"], "c", lazy.spawn("code --force-device-scale-factor=1.5")),

    # Web Browser
    ([mod], 'b', lazy.spawn(config['browser'])),

    # Screenshot Tool
    ([], 'Print', lazy.spawn('.config/rofi/bin/screenshot')),

    # Backlight
    ([mod], 'XF86AudioLowerVolume', lazy.spawn('brightnessctl set 5%-')),
    ([mod], 'XF86AudioRaiseVolume', lazy.spawn('brightnessctl set +5%')),

    # Volume
    ([], 'XF86AudioMute', lazy.spawn('pamixer --toggle-mute')),
    ([], 'XF86AudioLowerVolume', lazy.spawn('pamixer --decrease 5')),
    ([], 'XF86AudioRaiseVolume', lazy.spawn('pamixer --increase 5')),

    # Player
    # ([], 'XF86AudioPlay', lazy.spawn('playerctl play-pause')),
    # ([], 'XF86AudioPrev', lazy.spawn('playerctl previous')),
    # ([], 'XF86AudioNext', lazy.spawn('playerctl next')),
]]
