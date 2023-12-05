from libqtile.config import Screen

from core.bar import Bar
from utils.config import cfg
from os import path, listdir
import random

home_dir = path.expanduser('~')
wallpapers = listdir(f"{path.expanduser(cfg.wallpaper)}")

for file in wallpapers:
    if file[-4:] == '.jpg' or file[-4:] == '.png' or file[-5:] == '.jpeg':
        continue
    else:
        wallpapers.remove(file)
wallpaper_path = path.join(cfg.wallpaper, random.choice(wallpapers))

screens = [
    Screen(
        wallpaper=wallpaper_path,
        wallpaper_mode="fill",
        top=Bar(cfg.bar).create(),
    ),
    Screen(
        wallpaper=wallpaper_path,
        wallpaper_mode="fill",
        top=Bar(cfg.bar2).create(),
    ),
]
