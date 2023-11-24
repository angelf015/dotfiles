from libqtile.widget.battery import Battery, BatteryState


# Battery configuration


class MyBattery(Battery):
    def build_string(self, status):
        if self.layout is not None:
            if status.state == BatteryState.DISCHARGING and status.percent < self.low_percentage:
                self.layout.colour = self.low_foreground
            else:
                self.layout.colour = self.foreground
        if status.state == BatteryState.DISCHARGING:
            if status.percent >= 0.90:
                char = '󰁹'
            elif status.percent >= 0.80:
                char = '󰂁'
            elif status.percent >= 0.70:
                char = '󰂀'
            elif status.percent >= 0.60:
                char = '󰁿'
            elif status.percent >= 0.50:
                char = '󰁾'
            elif status.percent >= 0.40:
                char = '󰁽'
            elif status.percent >= 0.30:
                char = '󰁼'
            elif status.percent >= 0.20:
                char = '󰁻'
            elif status.percent >= 0.10:
                char = '󰁺'
            else:
                char = '󱃍'
        elif status.percent >= 1 or status.state == BatteryState.FULL:
            char = '󰂅'
        elif status.state == BatteryState.EMPTY or \
                (status.state == BatteryState.UNKNOWN and status.percent == 0):
            char = '󰂎'
        else:
            char = ' '
        return self.format.format(char=char, percent=status.percent)

# def battery(bg=color['yellow'], fg=color['bg']):
#    return MyBattery(
#        format='{percent:2.0%} {char} ',
#        low_foreground="green",
#        show_short_text=False,
#        low_percentage=0.25,
#        fontsize=14,
#        update_interval=5,
#        font="JetBrainsMonoExtraBold Nerd Font",
#        # background=colors[0],
#        foreground=fg,
#        background=bg
#    )
