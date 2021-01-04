import atexit
import os
import readline

HISTLENGTH = 1000

if 'PYTHONHISTFILE' in os.environ:
    hist_file = os.path.expanduser(os.environ['PYTHONHISTFILE'])
elif 'XDG_DATA_HOME' in os.environ:
    hist_file = os.path.join(os.path.expanduser(os.environ['XDG_DATA_HOME']),
                            'python', 'python_history')
else:
    hist_file = os.path.join(os.path.expanduser('~'), '.python_history')

hist_file = os.path.abspath(hist_file)
_dir, _ = os.path.split(hist_file)
os.makedirs(_dir, exist_ok=True)

try:
    readline.read_history_file(hist_file)
    readline.set_history_length(HISTLENGTH)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, hist_file)

