## Set-ExecutionPolicy RemoteSigned

## Window Title
#(Get-Host).UI.RawUI.WindowTitle = "v(^_^)v PowerShell 7 b(^_^)d";
(Get-Host).UI.RawUI.WindowTitle = "v(^_^)v PowerShell b(^_^)d";

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
function CopyRecursive {
    Param(
            [Parameter(Position=1)] [String] $path_source,
            [Parameter(Position=2)] [String] $path_destination
         )
        Copy-Item -recurse $path_source $path_destination
}
function RemoveRecursive {
    Param(
            [Parameter(Position=1)] [String] $path_target
         )
        Remove-Item -recurse $path_target
}
function MakeJunction {
    Param(
            [Parameter(Position=1)] [String] $path_jump,
            [Parameter(Position=2)] [String] $path_link
         )
        New-Item -ItemType Junction -Path $path_link -Value $path_jump
}

New-Alias -name x          -value Exit
Set-Alias -name grep       -value Select-String
Set-Alias -name which      -value where.exe
set-Alias -name cp_r       -value CopyRecursive
set-Alias -name rm_r       -value RemoveRecursive
set-Alias -name mkjunction -value MakeJunction

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

