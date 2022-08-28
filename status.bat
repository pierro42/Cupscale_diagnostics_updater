@echo OFF
echo BEGINNING OF SCRIPT > status.txt
echo ____________ >> status.txt
echo. >> status.txt
echo. >> status.txt
echo %date% >> status.txt

set /p pythonFolder="Paste here the cupscale python folder then press enter:   "

echo. >> status.txt
echo Using %pythonFolder%\python.exe >> status.txt
echo. >> status.txt

cls
"%pythonFolder%\python.exe" -m pip list >> status.txt
"%pythonFolder%\python.exe" status.py

cls
type status.txt
start notepad.exe status.txt
echo.
echo.

