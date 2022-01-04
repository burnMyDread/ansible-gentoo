#!/bin/bash
set -e
latest="http://distfiles.gentoo.org/releases/amd64/autobuilds/latest-stage3.txt"
stage3_path=$(curl $latest |  tail -n +3 | grep stage3-amd64 | cut -f 1,1 -d ' ' | grep {{ type }})
echo {{ mirror }}/releases/amd64/autobuilds/$stage3_path > url.txt
wget  {{ mirror }}/releases/amd64/autobuilds/$stage3_path -O \
      stage3.tbz2
tar tf stage3.tbz2
