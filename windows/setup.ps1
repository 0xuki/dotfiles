Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

function Create-SymbolicLink {
    param (
        [string]$LinkPath,
        [string]$TargetPath
    )
    # Ensure target directory exists
    $targetDir = Split-Path -Path $LinkPath -Parent
    if (-not (Test-Path $targetDir)) {
        New-Item -Path $targetDir -ItemType Directory -Force
    }

    Write-Host "Creating symbolic link: $LinkPath -> $TargetPath"
    sudo New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
}

$repoPath = Split-Path $PSScriptRoot -Parent # Path to the root of the repository
$userProfile = $Env:USERPROFILE

# Specific target locations
$nvimTarget = Join-Path $userProfile "AppData\Local\nvim"
$vifmTarget = Join-Path $userProfile ".vifm"
$windowsTerminalTarget = Join-Path $userProfile "AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# Create symbolic links for specific configurations
Create-SymbolicLink -LinkPath $nvimTarget -Target "$repoPath\common\.config\nvim"
Create-SymbolicLink -LinkPath $vifmTarget -Target "$repoPath\common\.config\.vifm"
Create-SymbolicLink -LinkPath $windowsTerminalTarget -Target "$repoPath\windows\.config\windowsterminal\settings.json"

# Exclude directory paths from general linking
$excludedDirPaths = @(
    (Resolve-Path "$repoPath\common\.config\nvim").Path.ToLower(),
    (Resolve-Path "$repoPath\common\.config\.vifm").Path.ToLower(),
    (Resolve-Path "$repoPath\windows\.config\windowsterminal").Path.ToLower()
)

# Function to recursively check if a path is under any of the excluded directories
function IsUnderExcludedPath {
    param (
        [string]$Path,
        [array]$ExcludedPaths
    )
    foreach ($excludedPath in $ExcludedPaths) {
        if ($Path.StartsWith($excludedPath)) {
            return $true
        }
    }
    return $false
}

# Function to create links for all files within a specific configuration directory
function CreateLinksForConfig {
    param (
        [string]$SourceRoot,
        [string]$TargetRoot,
        [array]$ExcludeDirPaths
    )
    $configFiles = Get-ChildItem -Path $SourceRoot -Recurse -File
    foreach ($file in $configFiles) {
        $fileDirLower = (Resolve-Path $file.Directory.FullName).Path.ToLower()
        if (-not (IsUnderExcludedPath $fileDirLower $ExcludeDirPaths)) {
            $relativePath = $file.FullName.Substring($SourceRoot.Length + 1)
            $target = Join-Path $TargetRoot $relativePath
            Write-Host "Linking $file.FullName to $target"
            Create-SymbolicLink -LinkPath $target -Target $file.FullName
        } else {
            Write-Host "Skipping excluded path: $file.FullName"
        }
    }
}

# Create symbolic links for Windows and Common configurations in the user's .config directory
$userConfigDir = Join-Path $userProfile ".config"
CreateLinksForConfig -SourceRoot "$repoPath\windows\.config" -TargetRoot $userConfigDir -ExcludeDirPaths $excludedDirPaths
CreateLinksForConfig -SourceRoot "$repoPath\common\.config" -TargetRoot $userConfigDir -ExcludeDirPaths $excludedDirPaths

Write-Host "All symbolic links have been created."