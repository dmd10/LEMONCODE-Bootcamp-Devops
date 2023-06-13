#!/bin/bash
set -e

DEFAULT="Me encanta bash!!"
VAR1=${1:-$DEFAULT}

mkdir -p foo/{dummy,empty} && echo $VAR1 > foo/dummy/file1.txt && touch foo/dummy/file2.txt

cat foo/dummy/file1.txt > foo/dummy/file2.txt && mv foo/dummy/file2.txt foo/empty/