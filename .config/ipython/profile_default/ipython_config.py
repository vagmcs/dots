c = get_config()

c.InteractiveShell.autoindent = True
c.InteractiveShell.confirm_exit = False

c.InteractiveShellApp.exec_lines = [
    'import numpy as np',
    'import pandas as pd',
    'import matplotlib.pyplot as plt'
]

