@echo off
setlocal
cd /d "%~dp0"

if not exist "frida-il2cpp-bridge.js" (
    echo [ERROR] frida-il2cpp-bridge.js is missing.
    pause
    exit /b 1
)

if not exist "Xerox.compiled.js" (
    echo [ERROR] Xerox.compiled.js is missing.
    pause
    exit /b 1
)

echo [infinite.lol] Loading the self-contained current-build bundle...
frida -l "frida-il2cpp-bridge.js" -l "Xerox.compiled.js" "EACLauncher.exe"
set "frida_exit=%errorlevel%"

if not "%frida_exit%"=="0" echo [ERROR] Frida exited with code %frida_exit%.
pause
exit /b %frida_exit%
