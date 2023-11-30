from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from extras import float_to_front
from utils.config import cfg

if cfg.is_xephyr:
    mod, alt = "mod1", "control"
    restart = lazy.restart()
else:
    mod, alt = "mod4", "mod1"
    restart = lazy.reload_config()

if not cfg.term:
    cfg.term = guess_terminal()

keys = [Key(*key) for key in [  # type: ignore
    # Switch between windows in current stack pane
    ([mod], "down", lazy.layout.down()),
    ([mod], "up", lazy.layout.up()),
    ([mod], "left", lazy.layout.left()),
    ([mod], "right", lazy.layout.right()),

    # move windows between columns
    ([mod], "h", lazy.layout.shuffle_left()),
    ([mod], "j", lazy.layout.shuffle_down()),
    ([mod], "k", lazy.layout.shuffle_up()),
    ([mod], "l", lazy.layout.shuffle_right()),

    # increase/decrease window size
    ([mod], "u", lazy.layout.shrink()),
    ([mod], "y", lazy.layout.grow()),

    # window management
    ([mod, "shift"], "space", lazy.layout.flip()),
    ([mod], "q", lazy.layout.maximize()),
    ([mod], "w", lazy.window.kill()),
    ([], "F11", lazy.window.toggle_fullscreen()),

    # floating window management
    ([mod], "space", lazy.window.toggle_floating()),
    ([mod], "s", lazy.function(float_to_front)),
    ([mod], "c", lazy.window.center()),

    # toggle between layouts
    ([mod], "Tab", lazy.next_layout()),

    # qtile stuff
    ([mod, "control"], "b", lazy.hide_show_bar()),
    ([mod, "control"], "x", lazy.shutdown()),
    ([mod], "x", lazy.spawn(".config/rofi/bin/powermenu")),
    ([mod, "shift"], "x", lazy.spawn("archlinux-logout")),
    ([mod, "control"], "r", restart),

    # terminal
    ([mod], "Return", lazy.spawn(cfg.term)),
    ([mod, "shift"], "Return", lazy.spawn(cfg.term2)),

    # tools
    ([mod], "e", lazy.spawn("nemo")),
    ([mod], "p", lazy.spawn(
        "xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 "
        "--rotate normal --rate 144")),
    ([mod], "o", lazy.spawn("xrandr --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal")),

    # app launcher
    ([mod], "m", lazy.spawn(".config/rofi/bin/launcher")),
    ([mod, "shift"], "m", lazy.spawn("rofi -show drun")),
    ([mod], "r", lazy.spawn("sh .config/rofi/bin/music")),

    # web browser
    ([mod], "b", lazy.spawn(cfg.browser)),

    # screenshot tool
    ([], "Print", lazy.spawn(".config/rofi/bin/screenshot")),

    # backlight
    ([mod], "XF86AudioLowerVolume", lazy.spawn("brightnessctl set 5%-")),
    ([mod], "XF86AudioRaiseVolume", lazy.spawn("brightnessctl set +5%")),

    # volume
    ([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    ([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    ([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),

    # player
    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
]]  # fmt: skip
