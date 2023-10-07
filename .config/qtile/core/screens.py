import random

from libqtile.config import Screen

from core.bar import bar
from os import path, listdir
from utils import config

home_dir = path.expanduser('~')
wallpapers = listdir(f"{path.expanduser(config['wallpaper'])}")

for file in wallpapers:
    if file[-4:] == '.jpg' or file[-4:] == '.png' or file[-5:] == '.jpeg':
        continue
    else:
        wallpapers.remove(file)
wallpaper_path = path.join(config['wallpaper'], random.choice(wallpapers))

screens = [
    Screen(
        wallpaper=wallpaper_path,
        wallpaper_mode='fill',
        top=bar,
    ),

    Screen(
        wallpaper=wallpaper_path,
        wallpaper_mode='fill',
    ),
]
