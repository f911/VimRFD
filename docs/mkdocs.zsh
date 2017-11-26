#!/usr/bin/env zsh

# in current directory $(dirname $0) use command `./mkdocs.zsh` to run it.

mkdocs build
mkdocs serve > mkdocs.log 2>&1 &

[[ $? -ne 0 ]] && xdg-open http://localhost:8000


# vim:nocp:ai:si:et:ts=4:sts=4:ft=zsh:ff=unix:fenc=utf-8:
# EOF
