emulate sh
. ~/.profile
emulate zsh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
