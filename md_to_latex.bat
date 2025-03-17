@echo off
setlocal enabledelayedexpansion

set "SRC_DIR=C:\Users\Gardo\Desktop\Thesis\chapters_md"
set "DEST_DIR=C:\Users\Gardo\Desktop\Thesis\chapters"

:: Crea la cartella di destinazione se non esiste
if not exist "!DEST_DIR!" mkdir "!DEST_DIR!"

:: Loop attraverso tutti i file .md nella cartella sorgente
for %%F in ("!SRC_DIR!\*.md") do (
    set "filename=%%~nF"
    pandoc "%%F" -o "!DEST_DIR!\!filename!.tex"
)