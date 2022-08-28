@echo OFF
title Cupscale Pytorch Updater (by pierro42)
echo BEGINNING OF SCRIPT >> update.txt
echo ____________ >> update.txt
echo. >> update.txt
echo. >> update.txt
echo %date% at %time% >> update.txt

set /p cupscale_folder="Paste here the cupscale folder then press enter:   "

echo. >> update.txt
echo Using %cupscale_folder%\CupscaleData\bin\py\python.exe >> update.txt
echo. >> update.txt
cls


echo Paste the url of pytorch then press enter.
echo (for example : https://download.pytorch.org/whl/cu116 )
set /p pytorch_url="Paste Here:"

echo. >> update.txt
echo Using %pytorch_url% >> update.txt
echo. >> update.txt

cls



"%cupscale_folder%\CupscaleData\bin\py\python.exe" -m pip install --upgrade pip
echo "%cupscale_folder%\CupscaleData\bin\py\python.exe" -m pip install --upgrade pip >> update.txt


echo .
echo .
echo We're going to remove torch, torchvision and torchaudio from :
echo %cupscale_folder%\CupscaleData\bin\py
echo and replace it with pytorch from %pytorch_url%
set /p option="do you wish to continue ? (y/n):"

IF %option% EQU y (
    echo User wants to remove pytorch >> update.txt
	"%cupscale_folder%\CupscaleData\bin\py\python.exe" -m pip uninstall torch torchvision torchaudio -y
	echo %cupscale_folder%\CupscaleData\bin\py\python.exe" -m pip uninstall torch torchvision torchaudio -y >> update.txt

)

IF %option% EQU n (
    echo User don't want to remove pytorch >> update.txt
)


"%cupscale_folder%\CupscaleData\bin\py\python.exe" -m pip install torch torchvision --extra-index-url %pytorch_url%
echo "%cupscale_folder%\CupscaleData\bin\py\python.exe" -m pip install torch torchvision --extra-index-url %pytorch_url% >> update.txt


echo.
echo.
echo END OF SCRIPT
echo ____________
echo.

echo. >> update.txt
echo END OF SCRIPT >> update.txt
echo ____________ >> update.txt
echo. >> update.txt
echo. >> update.txt
echo. >> update.txt


pause

cls
start notepad.exe update.txt
echo.
echo.

