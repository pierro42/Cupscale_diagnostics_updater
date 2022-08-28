# Cupscale embedded python diagnostics and updater
This could help find why cupscale doesn't work.

Download it the assets or here :
[cupscale_diagnostics_updater.zip](https://github.com/pierro42/Cupscale_diagnostics_updater/files/9440051/cupscale_diagnostics_updater.zip)


### DIAGNOSTICS :

1: Copy the cupscale exe path
( right click on cupscale, open directory, or you can also find it in the cupscale session log )

2: start the status.bat file 

3: paste the cupscale folder path then press enter

4: see what's going on


### UPDATER :

1: Copy the cupscale exe path
( right click on cupscale, open directory, or you can also find it in the cupscale session log )

2: start the update.bat file 

3: paste the cupscale folder path then press enter

4: go to https://pytorch.org/ and select the options to match the last version of cuda for pip windows like in picture below :

![example](https://github.com/pierro42/Cupscale_diagnostics_updater/blob/main/pytorch.png?raw=true)

5: Copy the link at the end of the command and paste it in the app, then press enter

6: Chose by typing "y" or "n" if you want to remove any existing torch / torchvision / torchaudio 

7: It should be ok, launch the diagnostics tool to see if it changed the pytorch version, and now satisfies the CUDA requirements


