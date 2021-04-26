
# Source the default configurations, otherwise some
# programs do not run correctly, e.g., GTK apps are slow.

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start BSPWM
exec bspwm

