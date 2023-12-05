from libqtile.config import Group, Key
from libqtile.lazy import lazy

from core.keys import keys, mod
from utils.match import wm_class

groups: list[Group] = []
for key, label, layout, matches in [
    ("1", "", None, wm_class("brave", "firefox")),
    ("2", "", "max", wm_class("code")),
    ("3", "", "matrix", wm_class("kitty")),
    ("4", "󰉋", None, wm_class("nemo")),
    ("5", "", "max", wm_class("subl")),
    ("6", "", "max", wm_class("obs")),
    ("7", "󰇮", "max", wm_class("telegram-desktop")),
    ("8", "", "max", wm_class("spotify", "vlc")),
]:
    groups.append(Group(key, matches, label=label, layout=layout))

    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], key, lazy.group[key].toscreen(toggle=True)),

        # mod1 + shift + letter of group = move focused window to group
        Key([mod, "shift"], key, lazy.window.togroup(key)),
    ])  # fmt: skip

