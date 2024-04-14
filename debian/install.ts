import { $ } from "bun";

async function installPackagesAndTools(): Promise<void> {
  // update
  await $`sudo apt update`;

  // basic tools
  await $`sudo apt install -y curl git build-essential vim tmux gcc zsh zip unzip nodejs npm`;

  // Neovim
  await $`curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage`;
  await $`chmod u+x nvim.appimage`;
  await $`./nvim.appimage --appimage-extract`;
  await $`sudo mv squashfs-root /`;
  await $`sudo ln -s /squashfs-root/AppRun /usr/bin/nvim`;

  // tmux plugin manager
  await $`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`;

  // fzf
  await $`git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`;
  await $`~/.fzf/install`;

  // Starship
  await $`curl -sS https://starship.rs/install.sh | sh`;

  // Rust
  await $`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`;

  // eza
  await $`cargo install eza`;

  // Golang
  await $`curl -LO https://go.dev/dl/go1.22.1.linux-amd64.tar.gz`;
  await $`sudo rm -rf /usr/local/go`;
  await $`sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz`;

  // Node.js
  await $`sudo npm install -g n`;
  await $`sudo n stable`;
  await $`sudo apt purge -y nodejs npm`;
  await $`sudo apt autoremove -y`;

  // Deno
  await $`curl -fsSL https://deno.land/x/install/install.sh | sh`;

  // Zsh
  const zshPath = await $`which zsh`;
  await $`chsh -s ${zshPath.out.trim()}`;

  console.log("completed");
}

await installPackagesAndTools();
