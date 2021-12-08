#!/bin/zsh

B=true
if [[ $SHELL = "/bin/zsh" ]]; then
#  if [[ "$(command -v nvm)" != "nvm" ]]; then
#    echo "Error: nvm not installed"
#  fi
  if ! [[ -x "$(command -v npm)" ]]; then
    if ! [[ -x "$(command -v node)" ]]; then
      echo "Error: Node (and npm) is not installed"
    else
      echo "Error: npm is not installed"
    fi
    $B=false
  fi
  if ! [[ -x "$(command -v git)" ]]; then
    echo "Error: git is not installed."
    $B=false
  fi
  if ! [[ "$(python3 -V)" =~ "Python 3" ]]; then
#    if [[ "$(python3 -V)" =~ "Python 3" && -f "$HOME/.zprofile" ]]; then
#      echo "alias python=python3" >> "$HOME/.zprofile"
#      echo "Set Python3 to default. Continuing..."
#    else
#      echo "Error: Python3 is not installed"
#    fi
    echo "Error: Python3 is not installed"
    $B=false
  fi
  echo "Done checking environment"
elif [[ $SHELL = "/bin/bash" ]]; then
  echo "Error: expected zsh"
else
  echo "Error: expected zsh"
fi

if $B; then
  echo "Environment properly configured."
else
  echo "Environment not properly configured."
fi