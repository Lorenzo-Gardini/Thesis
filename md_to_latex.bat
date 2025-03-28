@echo off
setlocal enabledelayedexpansion

set "SRC_DIR=C:\Users\Gardo\Desktop\Thesis\chapters_md"
set "DEST_DIR=C:\Users\Gardo\Desktop\Thesis\chapters"

if not exist "!DEST_DIR!" mkdir "!DEST_DIR!"

rem Scansione ricorsiva di tutti i file .md nella cartella sorgente e sottocartelle
for /R "%SRC_DIR%" %%F in (*.md) do (
    set "filepath=%%F"
    set "relpath=%%~dpF"
    set "filename=%%~nF"

    rem Rimuove il percorso sorgente iniziale per ottenere la struttura relativa
    set "relpath=!relpath:%SRC_DIR%\=!"
    
    rem Crea la sottocartella nella destinazione, se necessario
    if not exist "!DEST_DIR!\!relpath!" mkdir "!DEST_DIR!\!relpath!"

    rem Converte il file in LaTeX mantenendo la struttura
    pandoc "%%F" -o "!DEST_DIR!\!relpath!!filename!.tex"
)
