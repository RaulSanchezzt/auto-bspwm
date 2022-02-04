#!/bin/sh

target=$(cat ~/.config/polybar/scripts/target)

if [ $target ]; then
    echo " $target"
else
    echo " No target"
fi