#        _   _ _
#   __ _| |_(_) | ___
#  / _` | __| | |/ _ \
# | (_| | |_| | |  __/
#  \__, |\__|_|_|\___|
#     |_|
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"                    # Set mod key to SUPER 
app_mod = "mod1"                # Set application mod key to ALT
terminal = guess_terminal()     # Guess terminal application

keys = [


    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    Key([mod], "Return", lazy.spawn(terminal),
        desc="Launch terminal application"),

    Key([mod, "shift"], "Return", lazy.spawn("rofi -show run"),
        desc="Launch rofi launcher"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(),
        desc="Toggle between layouts"),

    Key([mod], "w", lazy.window.kill(),
        desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(),
        desc="Restart qtile"),

    Key([mod, "control"], "q", lazy.shutdown(),
        desc="Shutdown qtile"),

    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]


#
# Groups
#
group_names = [
    ("WWW", {'layout': 'monadtall'}),
    ("DEV", {'layout': 'monadtall'}),
    ("SYS", {'layout': 'monadtall'}),
    ("DOC", {'layout': 'monadtall'}),
    ("VBOX", {'layout': 'monadtall'}),
    ("CHAT", {'layout': 'monadtall'}),
    ("MUSIC", {'layout': 'monadtall'}),
    ("VIDEO", {'layout': 'monadtall'}),
    ("GFX", {'layout': 'floating'})
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group


#
# Nord color scheme
#
polar_night_colors = ["#2e3440", "#3b4252", "#434c5e", "#4c566a"]

snow_storm_colors = ["#d8dee9", "#e5e9f0", "#eceff4"]

frost_colors = ["#8fbcbb", "#88c0d0", "#81a1c1", "#5e81ac"]

aurora_colors = ["#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#b48ead"]


#
# Layouts
#
layout_config = {
    "margin": 8,
    "border_width": 4,
    "border_focus": aurora_colors[3],
    "border_normal": snow_storm_colors[0]
}

layouts = [
    layout.Max(),
    layout.Stack(num_stacks=2, **layout_config),
    layout.Bsp(),
    layout.Columns(),
    layout.Matrix(**layout_config),
    layout.MonadTall(**layout_config),
    layout.MonadWide(**layout_config),
    layout.RatioTile(),
    layout.Tile(),
    layout.TreeTab(),
    layout.VerticalTile(),
    layout.Floating(**layout_config)
]


#
# Widgets
#
widget_defaults = dict(
    font = 'Hack',
    fontsize = 14,
    padding = 3,
    background = polar_night_colors[0],
    foreground = snow_storm_colors[2]
)
extension_defaults = widget_defaults.copy()

widget_list = [
    widget.Sep(
        linewidth = 0,
        padding = 6
    ),
    widget.GroupBox(
        font = "Hack Bold",
        fontsize = 12,
        padding_x = 3,
        padding_y = 5,
        borderwidth = 3,
        rounded = False,
        active = snow_storm_colors[2],
        inactive = snow_storm_colors[2],
        highlight_color = aurora_colors[0],
        this_current_screen_border = aurora_colors[0],
        this_screen_border = aurora_colors[1],
        foreground = snow_storm_colors[2],
        highlight_method = "line"
    ),
    widget.Prompt(
        prompt = "spawn: ",
        font = "Hack Regular",
        fontsize = 16
    ),
    widget.Sep(
        linewidth = 0,
        padding = 10,
        foreground = snow_storm_colors[2]
    ),
    widget.WindowName(
        font = "Hack Bold",
        fontsize = 14,
        foreground = aurora_colors[4],
    ),
    widget.CheckUpdates(),
    widget.PulseVolume(),
    widget.TextBox(
        text = "Vol:",
        foreground = snow_storm_colors[2],
        background = aurora_colors[3]
    ),
    widget.Volume(
        font = "Hack Bold",
        foreground = snow_storm_colors[2],
        background = aurora_colors[3]
    ),
    widget.TextBox(
            text = "",
            background = aurora_colors[3],
            foreground = aurora_colors[4],
            fontsize = 45,
            padding = 0
    ),
    widget.ThermalSensor(
        font = "Hack Regular",
        fontsize = 14
    ),
    widget.CPU(
        font = "Hack Regular",
        fontsize = 14
    ),
    widget.Memory(
        font = "Hack Regular",
        fontsize = 14
    ),
    widget.CurrentLayoutIcon(),
    widget.CurrentLayout(
        font = "Hack Regular",
        fontsize = 14
    ),
    widget.Clock(
        font = "Hack Regular",
        fontsize = 14,
        format = "%a %d %b [ %H:%M ]"
    ),
    widget.Sep(
        linewidth = 0,
        padding = 5
    ),
    widget.KeyboardLayout(),
    widget.Systray()
]


#
# Screens configuration
#
screens = [Screen(top=bar.Bar(widgets=widget_list, opacity=1, size=24))]


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D" # Hack for Java UI toolkit
