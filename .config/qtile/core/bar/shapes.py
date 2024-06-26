from libqtile.bar import CALCULATED
from libqtile.lazy import lazy

from core.bar.base import base, powerline, rectangle, symbol, base2
from extras import Clock, GroupBox, TextBox, modify, widget
from extras.battery import MyBattery
from utils.config import cfg
from utils.palette import palette

bar = {
    "background": palette.base,
    "border_color": palette.base,
    "border_width": 4,
    # "margin": [10, 10, 0, 10],
    "margin": [0, 0, 0, 0],
    "opacity": 1,
    "size": 20,
}


def sep(fg, offset=0, padding=10):
    return TextBox(
        **base2(None, fg),
        **symbol(11),
        offset=offset,
        padding=padding,
        text="󰇙",
    )


groups = lambda bg: GroupBox(
    **symbol(),
    background=bg,
    borderwidth=1,
    colors=[
        palette.teal,
        palette.pink,
        palette.yellow,
        palette.red,
        palette.blue,
        palette.peach,
        palette.mauve,
        palette.green,
    ],
    highlight_color=palette.base,
    highlight_method="line",
    inactive=palette.surface2,
    invert=True,
    padding=6,
    rainbow=True,
)

logo = lambda bg, fg: TextBox(
    **base(bg, fg),
    **symbol(),
    **rectangle(),
    mouse_callbacks={"Button1": lazy.restart(),
                     "Button3": lazy.spawn(".config/qtile/utils/change_mod.sh")},
    padding=20,
    text="",
)

layout = lambda: [
    widget.CurrentLayoutIcon(
        scale=0.65,
        padding=5,
        **symbol(14),
    )
]

mpd = lambda bg, fg: [
    modify(
        TextBox,
        **base(bg, fg),
        **symbol(14),
        **rectangle("left"),
        offset=-1,
        padding=5,
        text="",
    ),
    widget.Mpd2(
        **base(bg, fg),
        **powerline("arrow_right"),
        # idle_format='{play_status} {idle_message}[{repeat}{random}{single}{consume}{updating_db}]',
        status_format='{artist} -{title} {album}',
        # max_chars=10,
        mouse_buttons={1: 'toggle', 3: 'stop', 4: 'previous', 5: 'next'},
        width=50,
        scroll=True,
        scroll_interval=.04,
        scroll_repeat=True,
        scroll_delay=10,
        port=6600
    )
]

volume = lambda bg, fg: [
    modify(
        TextBox,
        **base(bg, fg),
        **symbol(),
        # **rectangle("left"),
        offset=-5,
        padding=5,
        text="",
        x=-2,
    ),
    widget.Volume(
        **base(bg, fg),
        **powerline("arrow_right"),
        check_mute_command="pamixer --get-mute",
        check_mute_string="true",
        get_volume_command="pamixer --get-volume-human",
        mute_command="pamixer --toggle-mute",
        update_interval=0.1,
        volume_down_command="pamixer --decrease 5",
        volume_up_command="pamixer --increase 5",
    ),
]

updates = lambda bg, fg: [
    TextBox(
        **base(bg, fg),
        **symbol(14),
        offset=-1,
        text="",
        x=-2,
    ),
    widget.CheckUpdates(
        **base(bg, fg),
        **rectangle("right"),
        colour_have_updates=bg if cfg.mod else fg,
        colour_no_updates=bg if cfg.mod else fg,
        custom_command=" " if cfg.is_xephyr else "checkupdates",
        display_format="{updates}  ",
        initial_text="0  ",
        no_update_string="0  ",
        padding=0,
        update_interval=3600,
    ),
]

window_name = lambda fg: widget.WindowName(
    **base2(None, fg),
    format="{name}",
    max_chars=60,
    width=CALCULATED,
)

cpu = lambda bg, fg: [
    modify(
        TextBox,
        **base(bg, fg),
        **symbol(14),
        **rectangle("left"),
        offset=-13,
        padding=15,
        text="󰍛",
    ),
    widget.CPU(
        **base(bg, fg),
        **powerline("arrow_right"),
        format="{load_percent:.0f}%",
    ),
]

ram = lambda bg, fg: [
    TextBox(
        **base(bg, fg),
        **symbol(14),
        offset=-1,
        padding=5,
        text="󰘚",
    ),
    widget.Memory(
        **base(bg, fg),
        **powerline("arrow_right"),
        format="{MemUsed: .0f}{mm} ",
        padding=-3,
    ),
]

disk = lambda bg, fg: [
    TextBox(
        **base(bg, fg),
        **symbol(14),
        offset=-1,
        text="",
        x=-2,
    ),
    widget.DF(
        **base(bg, fg),
        # **powerline("arrow_right"),
        **rectangle("right"),
        format="{f} GB  ",
        padding=0,
        partition="/home",
        visible_on_warn=False,
        warn_color=fg,
    ),
]

battery = lambda bg, fg: [
    modify(
        MyBattery,
        low_percentage=0.25,
        update_interval=5,
        format='{char}   {percent:2.0%} ',
        **base(bg, fg),
        **rectangle("right"),
        padding=0,
        partition='/',
        visible_on_warn=False,
        warn_color=fg,
    )
]

clock = lambda bg, fg: [
    modify(
        TextBox,
        **base(bg, fg),
        **symbol(14),
        **rectangle("left"),
        offset=-14,
        padding=15,
        text="",
    ),
    modify(
        Clock,
        **base(bg, fg),
        **rectangle("right"),
        format="%A - %I:%M %p ",
        long_format="%B %-d, %Y ",
        padding=7,
    ),
]

widgets = lambda: [
    widget.Spacer(length=1),
    logo(palette.blue, palette.base),
    sep(palette.surface2, offset=-14),
    groups(None),
    sep(palette.surface2, offset=8, padding=2),
    *layout(),
    *mpd(palette.teal, palette.base),
    *volume(palette.pink, palette.base),
    *updates(palette.red, palette.base),
    widget.Spacer(),
    window_name(palette.text),
    widget.Spacer(),
    *cpu(palette.green, palette.base),
    *ram(palette.yellow, palette.base),
    *disk(palette.teal, palette.base),
    # *battery(palette.mauve, palette.base),
    sep(palette.surface2),
    *clock(palette.pink, palette.base),
    widget.Spacer(length=1),
]
