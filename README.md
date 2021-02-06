# fake_tile

## The Story

I love the idea of tile based window managers such as i3 and Sway.

However as I have got older I find that outside of my development tools, I want a computing environment that just works and I don't find that tile based window managers give that experience for a variety of reasons.

## The Revelation

Once I have my window layout for a project configured I tend to keep it that way until I reboot, which may be months into the future. So I don't think the positioning of windows is the part of a tile based window manager that lays out the windows that I like.

I believe (right now, at the time of writing) that it is pressing using the WIN/Super and h, j, k and l to move around the open windows that really improves my workflows.

## The Plan

Given that I don't tend to have complicated window layouts. When the user requests to switch to a window in a given direction, it should be possible to to use `xdotool` or `wmctrl` to:

 * Find the current window
 * Look at what windows are in the desired direction
 * Use some maths, configuration assumptions and maybe state to figure out what window the user wants to switch to.

## The implementation

Please see [`fake_tile`](fake_tile).

 * `fake_tile` takes one argument which should be `left`, `right`, `up` or `down`.
 * If you have a terminal window you can type `fake_tile left` and it will switch to the / a window on the left.
 * If you are not in a terminal you probably want to bind it as a custom shortcut in your window manager / desktop environment of choice.
 * Uses [GNU Parallel](https://www.gnu.org/software/parallel/) to run `xdotool` and `wmctrl` which means it probably only works in X11/Xorg and not Wayland. Pull Requests are welcome.

## Installation

 * Install `xdotool`
 * Install `wmctrl`
 * Install [GNU Parallel](https://www.gnu.org/software/parallel/)
 * Copy this script somewhere...
 * Bind the desired keys to execute `fake_tile [DIRECTION]` in your favorite window manager (if in GNOME maybe [this will help](https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored/217310#217310)).

