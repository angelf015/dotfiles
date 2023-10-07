from libqtile import layout
from libqtile.config import Match

from utils import color

# ---- Tiling ---------------------------- #
# Default 'margin': 10,
config = {
    'border_focus': color['red'],
    'border_normal': color['bg'],
    'border_width': 0,
    'margin': [5, 5, 5, 5],  # [up, right, down, left] #Margen de la ventana
    'single_border_width': 0,
    'single_margin': 0,
}

layouts = [
    layout.Max(**config),
    layout.MonadWide(
        border_focus=color['red'],
        border_width=1,
        margin=8,
    ),
    layout.MonadTall(
        border_focus=color['red'],
        border_width=1,
        margin=8,
    ),
    layout.Bsp(**config),
    layout.Matrix(columns=2, **config),
    layout.RatioTile(**config),
]

# ---- Floating -------------------------- #
floating_layout = layout.Floating(
    border_focus=color['white'],
    # border_normal=color['bg'],
    # border_width=0,
    fullscreen_border_width=0,

    # Configuración de ventanas flotantes
    float_rules=[
        *layout.Floating.default_float_rules,
        *[Match(**rules) for rules in [
            {'wm_class': 'confirmreset'},
            {'wm_class': 'makebranch'},
            {'wm_class': 'maketag'},
            {'wm_class': 'ssh-askpass'},
            {'title': 'branchdialog'},
            {'title': 'pinentry'},
            {'wm_class': 'Arcolinux-welcome-app.py'},
            {'wm_class': 'Arcolinux-tweak-tool.py'},
            {'wm_class': 'Arcolinux-calamares-tool.py'},
            {'wm_class': 'makebranch'},
            {'wm_class': 'maketag'},
            {'wm_class': 'Arandr'},
            {'wm_class': 'feh'},
            {'wm_class': 'Galculator'},
            {'wm_class': 'arcolinux-logout'},
            {'wm_class': 'xfce4-terminal'},
            {'title': 'branchdialog'},
            {'title': 'Open File'},
            {'title': 'ArchLinux Logout'}
        ]]
    ],
)
