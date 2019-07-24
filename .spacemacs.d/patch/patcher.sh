#!/usr/bin/env bash

# https://github.com/jrblevin/markdown-mode/pull/393

cd $(dirname $0)

curl -L -o markdown-mode.el.markdown-header-scaling.patch https://patch-diff.githubusercontent.com/raw/jrblevin/markdown-mode/pull/393.patch

patch -f -p1 -d ~/.emacs.d/elpa/markdown-mode-20190305.319/ < markdown-mode.el.markdown-header-scaling.patch

emacs --batch --eval '(byte-recompile-directory "~/.emacs.d/elpa/markdown-mode-20190305.319/" 0 t)'

