#!/bin/bash

ARGS=("$@")
exit_code=1

for i in ${!ARGS[@]}; do
  echo -en "\e[93mmkth2\e[97m ${ARGS[i]}\e[0m..."
  mtn -P -f $HOME/.fonts/cousine.ttf -b 2 -c 4 -D 0 -h 100 -o _s.png -s 60 "${ARGS[i]}" && infile="${ARGS[i]%.*}" && cwebp -quiet -q 40 "${infile}_s.png" -o "${infile}_s.webp" && rm "${infile}_s.png" && {
    echo -e "\e[92mOK\e[0m"
    echo "${infile}_s.webp"
    exit_code=0
  } || {
    echo -e "\e[91mWARNING\e[0m" >&2
    exit_code=1
  }
done
exit $exit_code
