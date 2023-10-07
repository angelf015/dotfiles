from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

from core import bar
from core.keys import keys, mod

# Icons & Tags
groups, tag = [], bar.tags

# Workspaces
for g in (
        ('1', tag[0], 'max', [Match(wm_class='brave-browser')]),
        ('2', tag[1], 'max', [Match(wm_class='code')]),
        ('3', tag[2], 'matrix', [Match(wm_class="kitty")]),
        ('4', tag[3], 'max', []),
        ('5', tag[4], 'max', []),
        ('6', tag[5], 'max', []),
        ('7', tag[6], 'max', []),
        ('8', tag[7], 'max', []),
        ('9', tag[8], 'max', [Match(wm_class="spotify")]),
):
    args = {'label': g[1], 'layout': g[2], 'matches': g[3]}
    groups.append(Group(name=g[0], **args))

# Key Bindings
for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(toggle=True)),

        # mod1 + shift + letter of group = move focused window to group
        Key([mod, 'shift'], i.name, lazy.window.togroup(i.name)),
    ])
