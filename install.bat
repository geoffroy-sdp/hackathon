@echo off
setlocal enabledelayedexpansion

:: ==========================
:: INSTALLATION SCRIPT NVM + GIT
:: ==========================

:: --- Vérification si NVM est déjà installé ---
echo Verification de NVM...
where nvm >nul 2>nul
if %ERRORLEVEL%==0 (
    echo NVM est deja installe.
) else (
    echo Telechargement et installation de NVM...
    powershell -Command "Invoke-WebRequest -Uri https://github.com/coreybutler/nvm-windows/releases/latest/download/nvm-setup.exe -OutFile nvm-setup.exe"
    start /wait nvm-setup.exe
)

:: --- Vérification si Git est déjà installé ---
echo Verification de Git...
where git >nul 2>nul
if %ERRORLEVEL%==0 (
    echo Git est deja installe.
) else (
    echo Téléchargement et installation de Git...
    powershell -Command "Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/latest/download/Git-2.45.2-64-bit.exe -OutFile git-setup.exe"
    start /wait git-setup.exe /VERYSILENT /NORESTART
)

:: ==========================
:: TESTS UNITAIRES INSTALLATION
:: ==========================
echo.
echo --- Tests unitaires ---
echo.

:: Test NVM
nvm version >nul 2>nul
if %ERRORLEVEL%==0 (
    echo Test NVM : OK
) else (
    echo Test NVM : ECHEC
)

:: Test Git
git --version >nul 2>nul
if %ERRORLEVEL%==0 (
    echo Test Git : OK
) else (
    echo Test Git : ECHEC
)

echo.
echo Installation terminee.
pause
endlocal
