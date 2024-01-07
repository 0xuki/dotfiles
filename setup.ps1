Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
# Function to create a symbolic link
function Create-SymbolicLink {
    param (
        [string]$LinkPath,
        [string]$TargetPath
    )
    
    # Backup existing files or directories, if any
    if (Test-Path $LinkPath) {
        $backupPath = "$LinkPath.backup"
        Write-Host "Create backup: $LinkPath -> $backupPath"
        Move-Item -Path $LinkPath -Destination $backupPath
    }

    # Create symbolic link
    Write-Host "Create symbolic link: $LinkPath -> $TargetPath"
    sudo New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
}

# Use the directory where the script exists as the repository path
$repoPath = $PSScriptRoot

# User Profile Path
$userProfile = $Env:USERPROFILE

# Setting up symbolic links
Create-SymbolicLink -LinkPath "$userProfile\.config" -Target "$repoPath\.config"
Create-SymbolicLink -LinkPath "$userProfile\.vifm" -Target "$repoPath\.config\.vifm"
Create-SymbolicLink -LinkPath "$userProfile\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$repoPath\.config\windowsterminal\settings.json"

Write-Host "All symbolic links have been created."

