# Install Scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# Package List
$packages = @('neovim', 'fzf', 'gcc', 'gsudo', 'oh-my-posh', 'vifm', 'rust-analyzer', 'terminal-icons', 'ripgrep', 'neofetch', 'glazewm', 'cmake', 'make', 'ninja', 'llvm')

# Install Package
foreach ($package in $packages) {
    scoop install $package
}

Write-Host "All packages installed successfully"

