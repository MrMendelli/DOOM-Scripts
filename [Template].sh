#!/bin/sh

modloader=`basename -s .sh "$0"`

if ! [ test -e "./Settings/$modloader.ini" ]; then
    cp -nT "./Settings/ZDoom (<Type>).ini" "./Settings/$modloader.ini"
fi

"<Engine>" +screenblocks 11 -iwad "./WADs/<WAD>" -config "./Settings/$modloader.ini" -savedir "./Saves/$modloader" -shotdir "./Screenshots/$modloader" -file "./Mods/<ModBin>"
