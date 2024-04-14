import { $ } from "bun";

async function installPackages(filename: string): Promise<void> {
  const data = await Bun.file(filename).text();
  const packages = data.split("\n");

  for (const pkg of packages) {
    if (pkg) {
      console.log(`Installing ${pkg}...`);
      try {
        await $`yay -S --noconfirm ${pkg}`;
        console.log(`${pkg} installed successfully.`);
      } catch (error) {
        console.error(`Failed to install ${pkg}: ${error}`);
      }
    }
  }
}

const filename = "pkgs.txt";
await installPackages(filename);
