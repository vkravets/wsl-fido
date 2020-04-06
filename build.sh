#!/bin/ash

abuild-keygen -nia

ROOT=$PWD

cd $ROOT/huskylib
abuild deps
abuild

cd $ROOT/smapi
abuild deps
abuild

cd $ROOT/fidoconf
abuild deps
abuild

cd $ROOT/hptzip
abuild deps
abuild

cd $ROOT/areafix
abuild deps
abuild

cd $ROOT/hpt
abuild deps
abuild

cd $ROOT/binkd
abuild deps
abuild

cd $ROOT/golded
abuild deps
abuild

cd $ROOT/luit
abuild deps
abuild
