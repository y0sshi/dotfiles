:: Command Prompt Profile
:: Registry Editor
::   > \HKEY_CURRENT_USER\Software\Microsoft\Command Processor
::     - AutoRun = ${PROFILE_PATH}
::   > \HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor
::     - AutoRun = ${PROFILE_PATH}
@echo off

:: Prompt
prompt [92m%USERNAME%@%COMPUTERNAME%[93m[$p] [96m[$d $t][0m [cmd]$G 

:: Alias
doskey ls    = dir
doskey emacs = nvim
doskey x     = exit
