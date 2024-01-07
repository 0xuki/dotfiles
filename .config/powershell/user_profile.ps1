Write-Host "Current Git User: $(git config --global user.name)"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme C:\Users\chocomint\.config\powershell\laf3.omp.json

# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'laf3.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT CONFIG | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
#ListViewCommand
# Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias gb 'C:\Developments\GitNavi\target\debug\GitNavi.exe'
Set-Alias wz 'C:\Program Files\WezTerm\wezterm-gui.exe'
Set-Alias -Name komostart -Value Start-Komorebic
Set-Alias chrome 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
      Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Set-PSReadLineOption -Colors @{
    "Parameter" = [ConsoleColor]::White
    "Operator" = [ConsoleColor]::Gray
}
function Start-Komorebic {
    komorebic start -c $Env:USERPROFILE\.config\komorebi\komorebi.json --whkd
}

$Env:KOMOREBI_CONFIG_HOME = 'C:\Users\chocomint\.config\komorebi'
function Start-Glaze {
    & 'C:\Users\chocomint\scoop\apps\glazewm\current\GlazeWM.exe' --config="C:\Users\chocomint\.config\glazeWM\config.yaml"
}
New-Alias -Name glaze -Value Start-Glaze
