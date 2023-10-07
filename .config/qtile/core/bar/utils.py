from extras import PowerLineDecoration, RectDecoration

# Default fontsize = 10
# Font: SauceCodePro Nerd Font Medium
defaults = {
    'font': 'Hack Nerd Font',
    'fontsize': 13,
    'padding': None,
}


def base(bg: str, fg: str) -> dict:
    return {
        'background': bg,
        'foreground': fg,
    }


def decoration(side: str = '') -> dict:
    return {'decorations': [
        RectDecoration(
            filled=True,
            radius={
                'left': [8, 0, 0, 8],
                'right': [0, 8, 8, 0]
            }.get(side, 8),
            use_widget_background=True,
        )
    ]}


# Default fontsize = 15
def iconfont(size=15) -> dict:
    return {
        'font': 'Hack Nerd Font',
        'fontsize': size
    }


def powerline(path: str | list, size=9) -> dict:
    return {'decorations': [
        PowerLineDecoration(
            path=path,
            size=size,
        )
    ]}
