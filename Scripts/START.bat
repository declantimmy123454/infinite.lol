@echo off
:frida

color 9
title menu (start.bat)
echo setting up paths
set PATH=%PATH%;%APPDATA%\Python\Python312\Scripts
set PATH=%PATH%;C:\Users\%USERNAME%\AppData\Local\Python\pythoncore-3.14-64\Scripts
set PATH=%PATH%;%LOCALAPPDATA%\Python\pythoncore-3.14-64\Scripts
set SOURCE=%~dp0sounds
set TARGET=C:\Program Files (x86)\Steam\steamapps\common\Animal Company\sounds

if not exist "%TARGET%" mkdir "%TARGET%"

echo ----------------------------------

echo installing and updating dependeties
pip install frida-tools
echo ----------------------------------
python -m pip install frida-tools
call npm install discord-rpc ts-node typescript @types/node
echo ----------------------------------
echo doing sound things 
for %%F in ("%SOURCE%\*.wav") do (
    if not exist "%TARGET%\%%~nxF" (
        copy "%%F" "%TARGET%\%%~nxF" >nul
        echo Added %%~nxF
    )
)
echo Starting Discord Rich Presence...
:: Adding --transpile-only skips the type check so it boots instantly
start cmd /k "npx ts-node --transpile-only discordrpc.ts"


echo press enter when you are loading into the game
pause >nul

start questservers.bat
frida -l frida-il2cpp-bridge.js -l da.ts -l symbols.ts -l nophoton.ts "AnimalCompany.exe"

color 4
echo ----------------------------------
echo failed to inject!!!
echo press enter to inject the menu and quest servers again!
pause > nul
cls
goto frida