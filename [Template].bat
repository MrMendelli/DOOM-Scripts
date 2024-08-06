@echo off

if not exist ".\Engine" md ".\Engine"
if not exist ".\Mods" md ".\Mods"
if not exist ".\Saves" md ".\Saves"
if not exist ".\Screenshots" md ".\Screenshots"
if not exist ".\Settings" md ".\Settings"
if not exist ".\WADs" md ".\WADs"

if exist ".\Settings\%~n0.ini" (goto :run) else (copy ".\Settings\ZDoom (<Type>).ini" ".\Settings\%~n0.ini")

:run
start "" "<Engine>" +screenblocks 11 -iwad ".\WADs\<WAD>" -config ".\Settings\%~n0.ini" -savedir ".\Saves\%~n0" -shotdir ".\Screenshots\%~n0" -file ".\Mods\<ModBin>"
