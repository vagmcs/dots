import warnings

# ignore warnings related to virtualenv
warnings.filterwarnings("ignore", message=".*virtualenv.*")

c = get_config()  # type: ignore

# automatically indent code blocks and disable exit confirmation
c.InteractiveShell.autoindent = True
c.InteractiveShell.confirm_exit = False

# syntax highlighting
c.TerminalInteractiveShell.true_color = True
c.TerminalInteractiveShell.highlighting_style = "catppuccin-mocha"

# suppress warnings
c.InteractiveShellApp.exec_lines = [
    "import warnings",
    'warnings.filterwarnings("ignore", message=".*virtualenv.*")',
]
