@echo OFF
title Cupscale Pytorch status (by pierro42)
echo BEGINNING OF SCRIPT >> status.txt
echo ____________ >> status.txt
echo. >> status.txt
echo. >> status.txt
echo %date% at %time% >> status.txt

set /p cupscale_folder="Paste here the cupscale folder then press enter:   "

echo. >> status.txt
echo Using %cupscale_folder%\CupscaleData\bin\py\python.exe >> status.txt
echo. >> status.txt

cls
"%cupscale_folder%\CupscaleData\bin\py\python.exe" -m pip list >> status.txt
"%cupscale_folder%\CupscaleData\bin\py\python.exe" status.py

echo.>> status.txt
echo.>> status.txt
echo.>> status.txt

cls
type status.txt
start notepad.exe status.txt
echo.
echo.

