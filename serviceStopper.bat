@echo off
set service=PhoneSvc
for /F "tokens=3 delims=: " %%H in ('sc query "%service%" ^| findstr "        STATE"') do (
	if /I "%%H" NEQ "RUNNING" (
		sc config %service% start= disabled
		goto end_Success
	)
)
echo "We didn't find the service"
pause
exit
:end_Success
	echo The %service% has been disabled
	echo(
	echo You will need to restart your computer for the changes to take affect, thanks!
	echo(
	pause
