from libqtile.bar import CALCULATED
from libqtile.lazy import lazy

from core.bar.utils import base, iconfont
from extras import Clock, GroupBox, modify, TextBox, Volume, widget, MyBattery
from utils import color

tags = [
    # '󰈹', '', '', '', '󰬷', '', '󰉋', '', '',
    # '', '', '', '', '󰬷', '', '󰉋', '', '',
    '', '', '', '', '', '', '', '', '',
]

# 'margin': [10, 10, 0, 10],
# size: 25
# border_width: 4
bar = {
    'background': color['bg'],
    'border_color': color['bg'],
    'border_width': 2,
    'margin': [5, 5, 0, 5],  # [up, right, down, left]
    'opacity': 1,
    'size': 25,
    'border_radius': 8
}


def sep(fg: str, offset=0, padding=8) -> TextBox:
    return TextBox(
        **base('', fg),
        **iconfont(),
        offset=offset,
        padding=padding,
        text='󰇙',
    )


def logo(bg: str, fg: str) -> TextBox:
    return modify(
        TextBox,
        **base(fg, bg),
        # **decoration(),
        **iconfont(),
        mouse_callbacks={'Button1': lazy.restart()},
        offset=4,
        padding=5,
        text='',
    )


def groups(bg: str) -> GroupBox:
    return GroupBox(
        **iconfont(),
        background=bg,
        borderwidth=1,
        colors=[
            color['cyan'], color['magenta'], color['yellow'], color['red'],
            color['blue'], color['green'], color['white'], color['blue'], color['green'],
        ],
        highlight_color=color['bg'],
        highlight_method='line',
        inactive=color['black'],
        invert=True,
        padding=5,
        rainbow=True,
        rounded=True
    )


def volume(bg: str, fg: str) -> list:
    return [
        modify(
            TextBox,
            **base(fg, bg),
            # **decoration('left'),
            **iconfont(),
            text='',
            x=4,
        ),
        modify(
            Volume,
            **base(fg, bg),
            # **powerline('arrow_right'),
            commands={
                'decrease': 'pamixer --decrease 5',
                'increase': 'pamixer --increase 5',
                'get': 'pamixer --get-volume-human',
                'mute': 'pamixer --toggle-mute',
            },
            update_interval=0.1,
            padding=5
        ),
    ]


def updates(bg: str, fg: str) -> list:
    return [
        TextBox(
            **base(fg, bg),
            **iconfont(),
            offset=-1,
            text='',
            x=1,
        ),
        widget.CheckUpdates(
            **base(fg, bg),
            # **decoration('right'),
            colour_have_updates=bg,
            colour_no_updates=bg,
            display_format='{updates}',
            distro='Arch_checkupdates',
            initial_text='0',
            no_update_string='0',
            padding=5,
            update_interval=3600,
        ),
    ]


def window_name(bg: str, fg: str) -> object:
    return widget.WindowName(
        **base(bg, fg),
        # **decoration('left'),
        # **decoration('left'),
        format='{name}',
        max_chars=60,
        width=CALCULATED,
    )


def mpd(bg: str, fg: str) -> object:
    return widget.Mpd2(
        **base(fg, bg),
        # **decoration('left'),
        # **decoration('left'),
        # idle_format='{play_status} {idle_message}[{repeat}{random}{single}{consume}{updating_db}]',
        status_format='{play_status} {artist} -{title} {album}',
        # max_chars=10,
        mouse_buttons={1: 'toggle', 3: 'stop', 4: 'previous', 5: 'next'},
        width=100,
        scroll=True,
        scroll_interval=.04,
        scroll_repeat=True,
        scroll_delay=10,
        port=7777
    )


def cpu(bg: str, fg: str) -> list:
    return [
        modify(
            TextBox,
            **base(fg, bg),
            # **decoration('left'),
            **iconfont(),
            offset=3,
            text='',
            x=1,
        ),
        widget.CPU(
            **base(fg, bg),
            # **powerline('arrow_right'),
            format='{load_percent:.0f}%',
            padding=5
        )
    ]


def ram(bg: str, fg: str) -> list:
    return [
        TextBox(
            **base(fg, bg),
            # **decoration('left'),
            **iconfont(),
            offset=-2,
            padding=5,
            text='󰘚',
            x=1,
        ),
        widget.Memory(
            **base(fg, bg),
            # **powerline('arrow_right'),
            format='{MemUsed: .0f}{mm} ',
            padding=5,
        ),
    ]


def disk(bg: str, fg: str) -> list:
    return [
        TextBox(
            **base(fg, bg),
            **iconfont(),
            offset=-1,
            text='',
            x=1,
        ),
        widget.DF(
            **base(fg, bg),
            # **decoration('right'),
            format='{f} GB  ',
            padding=5,
            partition='/home',
            visible_on_warn=False,
            warn_color=fg,
        ),
    ]


def battery(bg: str, fg: str):
    return [
        modify(
            MyBattery,
            low_percentage=0.25,
            update_interval=5,
            format='{char} {percent:2.0%} ',
            **base(fg, bg),
            # **powerline('arrow_right'),
            padding=0,
            partition='/',
            visible_on_warn=False,
            warn_color=fg,
        ),
    ]


def layout() -> list:
    return [
        widget.CurrentLayoutIcon(
            # **base(fg, bg),
            scale=0.65,
            padding=5,
        ),
        # widget.CurrentLayout(
        #     **base(fg, bg),
        #     # **decoration('right'),
        #     padding=10,
        # ),
    ]


def clock(bg: str, fg: str) -> list:
    return [
        modify(
            TextBox,
            **base(fg, bg),
            # **decoration('left'),
            **iconfont(),
            offset=2,
            text='',
            x=4,
        ),
        modify(
            Clock,
            **base(fg, bg),
            # **decoration('right'),
            format='%A - %I:%M %p ',
            long_format='%B %-d, %Y ',
            padding=5,
        ),
    ]


widgets = [
    widget.Spacer(length=2),
    logo(color['blue'], color['bg']),
    sep(color['black'], offset=-8),
    groups(bg=""),
    sep(color['black'], offset=4, padding=4),
    *layout(),
    mpd(color['magenta'], color['bg']),

    widget.Spacer(),
    window_name(color['bg'], color['fg']),
    widget.Spacer(),

    *volume(color['magenta'], color['bg']),
    *updates(color['red'], color['bg']),

    *cpu(color['green'], color['bg']),
    *ram(color['yellow'], color['bg']),
    *disk(color['cyan'], color['bg']),
    *battery(bg=color['green'], fg=color['bg']),

    sep(color['black']),
    *clock(color['magenta'], color['bg']),
    widget.Spacer(length=2),
]
