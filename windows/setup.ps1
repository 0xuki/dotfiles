Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

function Create-SymbolicLink {
    param (
        [string]$LinkPath,
        [string]$TargetPath
    )
    
    if (Test-Path $LinkPath) {
        $backupPath = "$LinkPath.backup"
        Write-Host "Creating backup: $LinkPath -> $backupPath"
        Move-Item -Path $LinkPath -Destination $backupPath
    }

    Write-Host "Creating symbolic link: $LinkPath -> $TargetPath"
    sudo New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
}
#
$repoPath = Split-Path $PSScriptRoot -Parent # Path to the root of the repository
$userProfile = $Env:USERPROFILE
$tempConfigPath = Join-Path $userProfile ".config_temp"

# Create a temporary directory to hold the merged configuration
New-Item -Path $tempConfigPath -ItemType Directory -Force

# Copy common and windows specific configurations into the temporary directory
Copy-Item -Path "$repoPath\common\.config\*" -Destination $tempConfigPath -Recurse -Force
Copy-Item -Path "$repoPath\windows\.config\*" -Destination $tempConfigPath -Recurse -Force

# Create symbolic link for the merged configuration
Create-SymbolicLink -LinkPath "$userProfile\.config" -Target $tempConfigPath

# Create additional symbolic links as needed
Create-SymbolicLink -LinkPath "$userProfile\.vifm" -Target "$repoPath\common\.config\.vifm"
Create-SymbolicLink -LinkPath "$userProfile\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$repoPath\windows\.config\windowsterminal\settings.json"
Create-SymbolicLink -LinkPath "$userProfile\AppData\Local\nvim" -Target "$repoPath\common\.config\nvim"

Write-Host "All symbolic links have been created."

# Clean up temporary directory
#Remove-Item -Path $tempConfigPath -Recurse -Force

