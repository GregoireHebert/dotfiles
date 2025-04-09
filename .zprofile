emulate sh
. ~/.profile
emulate zsh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2025-04-06 09:35:57
export PATH="$PATH:/Users/gheb/.local/bin"
