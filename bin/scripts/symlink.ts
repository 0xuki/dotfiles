import { $ } from "bun";

interface Link {
  source: string; 
  target: string; 
}

// dir of dotfiles
const dotfilesDir = "/path/to/your/dotfiles";

// createSymlinks function
async function createSymlinks(dotfilesDir: string, links: Link[]): Promise<void> {
  for (const link of links) {
    const fullPathSource = `${dotfilesDir}/${link.source}`;
    try {
      // remove existing file
      await $`rm -f ${link.target}`;
      // create symlink
      await $`ln -s ${fullPathSource} ${link.target}`;
      console.log(`Created symlink from ${fullPathSource} to ${link.target}`);
    } catch (error) {
      console.error(`Failed to create symlink from ${fullPathSource} to ${link.target}: ${error}`);
    }
  }
}

const links: Link[] = [
  { source: ".config/vimrc", target: "${HOME}/.vimrc" },
  { source: ".config/.vim", target: "${HOME}/.vim" },
  { source: ".config/nvim", target: "${HOME}/.config/nvim" },
  { source: ".config/.tmux.conf", target: "${HOME}/.tmux.conf"},
  { source: ".config/zsh/.zshrc", target: "${HOME}/.zshrc" },
  { source: ".config/zsh/.zshenv", target: "${HOME}/.zshenv" },
  { source: ".config/wezterm/wezterm.lua", target: "${HOME}/.config/wezterm/wezterm.lua" },
  { source: ".config/hypr", target: "${HOME}/.config/hypr" },
  { source: ".config/", target: "${HOME}/.config/" },
  { source: ".config/waybar", target: "${HOME}/.config/waybar" },
  { source: ".config/rofi", target: "${HOME}/.config/rofi" },
  { source: ".config/qt5ct", target: "${HOME}/.config/qt5ct" },
  { source: ".config/qt6ct", target: "${HOME}/.config/qt6ct" },
  { source: ".config/gtk-3.0", target: "${HOME}/.config/gtk-3.0" },
  { source: ".config/gtk-4.0", target: "${HOME}/.config/gtk-4.0" },
  { source: ".config/fontconfig", target: "${HOME}/.config/fontconfig" },
  { source: ".config/dunst", target: "${HOME}/.config/dunst" },
  { source: ".config/fcitx5", target: "${HOME}/.config/fcitx5" },
  { source: ".config/gtkrc-2.0", target: "${HOME}/.config/gtkrc-2.0" },
  { source: ".config/starship.toml", target: "${HOME}/.config/starship.toml" },
  { source: ".local/dolphin", target: "${HOME}/.local/dolphin" },
  { source: ".config/dolphinrc", target: "${HOME}/.config/dolphinrc" },
  { source: ".local/kxmlgui5", target: "${HOME}/.local/kxmlgui5" },
  { source: ".config/", target: "${HOME}/.config/" },
  { source: ".config/xsettingsd", target: "${HOME}/.config/xsettingsd" },
  { source: ".config/neofetch", target: "${HOME}/.config/neofetch" },




  //{ source: ".config/", target: "${HOME}/.config/" },
];

await createSymlinks(dotfilesDir, links);
