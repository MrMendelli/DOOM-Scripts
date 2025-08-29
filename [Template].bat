@echo off

setlocal EnableDelayedExpansion
title %~n0

if not exist ".\Engine" md ".\Engine"
if not exist ".\Mods" md ".\Mods"
if not exist ".\Saves" md ".\Saves"
if not exist ".\Screenshots" md ".\Screenshots"
if not exist ".\WADs" md ".\WADs"

if exist ".\Settings\%~n0.ini" (
    goto :run
) else if not exist ".\Settings\Templates\*.ini" (
    color 0c
    cls
    echo.
    echo Skipping input template selection:
    echo /Settings/Templates/ directory not foundnd, input templates are unavailabe...
    pause
    goto :run
)

:main
set "choice="
color 0f
cls
echo.
echo Available presets:
echo.
for %%a in (
    ".\Settings\Templates\*.ini"
) do (
    echo   %%~nxa
)
echo.
echo Vanilla ^(Tank Controls^) ....... 1
echo Mouselook ^(Modern^) ............ 2
echo Gamepad ^(Controller^) .......... 3
echo.
set /p "choice=Select input mode: "
echo.
if "!choice!" == "" (
    color 0c
    echo You must enter a valid menu option ^(1, 2, or 3^) to proceed...
    pause
    call :main
) else if "!choice!" == "1" (
    copy ".\Settings\Templates\Vanilla.ini" ".\Settings\%~n0.ini" > nul
    goto :run
) else if "!choice!" == "2" (
    copy ".\Settings\Templates\Mouselook.ini" ".\Settings\%~n0.ini" > nul
    goto :run
) else if "!choice!" == "3" (
    copy ".\Settings\Templates\Gamepad.ini" ".\Settings\%~n0.ini" > nul
    goto :run
) else (
    color 0c
    echo You must enter a valid menu option ^(1, 2, or 3^) to proceed...
    pause
    call :main
)

:run
if exist ".\WADs\freedoom1.wad" (
    set "wad=.\WADs\freedoom1.wad"
) else if exist ".\WADs\DOOM.wad" (
    set "wad=.\WADs\DOOM.wad"
) else if exist ".\WADs\freedoom2.wad" (
    set "wad=.\WADs\freedoom2.wad"
) else if exist ".\WADs\DOOM2.wad" (
    set "wad=.\WADs\DOOM2.wad"
) else (
    color 0c
    cls
    echo.
    echo No DOOM or DOOM II WAD found in /WADs/...
    echo You must have a copy of DOOM, FreeDOOM, or DOOM II here, or manually define the ^^!wad^^! path in this script.
    pause
    call exit
)

if exist ".\Engine\GZDoom\gzdoom.exe" (
    set "engine=.\Engine\GZDoom\gzdoom.exe"
) else (
    color 0c
    cls
    echo.
    echo GZDoom.exe not found in /Engine/GZDoom/...
    echo You must have GZDoom installed here or manually define the ^^!engine^^! path in this script.
    pause
    call exit
)

start "" "!engine!" +screenblocks 11 -iwad "!wad!" -config ".\Settings\%~n0.ini" -savedir ".\Saves\%~n0" -shotdir ".\Screenshots\%~n0" -file ".\Mods\<ModFile>"
exit /b 0
