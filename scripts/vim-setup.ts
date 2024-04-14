import { $ } from "bun";

async function setupRepositories(): Promise<void> { 
  await $`mkdir -p ~/.cache/dpp/repos/github.com/Shougo`;
  await $`mkdir -p ~/.cache/dpp/repos/github.com/vim-denops`;

  // Shougo repositories
  await $`cd ~/.cache/dpp/repos/github.com/Shougo`;
  await $`git clone https://github.com/Shougo/dpp.vim`;
  await $`git clone https://github.com/Shougo/dpp-ext-installer`;
  await $`git clone https://github.com/Shougo/dpp-protocol-git`;
  await $`git clone https://github.com/Shougo/dpp-ext-lazy`;
  await $`git clone https://github.com/Shougo/dpp-ext-toml`;

  // vim-denops
  await $`cd ../vim-denops`;
  await $`git clone https://github.com/vim-denops/denops.vim`;
}

await setupRepositories();
