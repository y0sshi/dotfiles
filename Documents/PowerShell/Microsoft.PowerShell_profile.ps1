## Set-ExecutionPolicy RemoteSigned

## Window Title
(Get-Host).UI.RawUI.WindowTitle = "v(^_^)v PowerShell 7 b(^_^)d";

## PROMPT
function prompt() {
	$host.UI.Write("Green", $host.UI.RawUI.BackgroundColor, "$($env:USERNAME)@$($env:COMPUTERNAME) ");
	$host.UI.Write("Yellow", $host.UI.RawUI.BackgroundColor, "[$(get-location)] ");
	$host.UI.Write("Cyan", $host.UI.RawUI.BackgroundColor, "[$(get-date -UFormat `"%Y/%m/%d %H:%M`")]");
	"`n`r "
}

## Shell Key-Bindings
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar

## Alias
function Exit{exit}
New-Alias -name x      -value Exit
Set-Alias -name grep   -value Select-String

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

