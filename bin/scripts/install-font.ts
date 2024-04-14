import { $ } from "bun";

type FontType = "otf" | "ttf";
type Destination = { [K in FontType]: string };

const DESTINATION: Destination = Bun.platform === "darwin"
  ? {
    otf: "/Library/Fonts",
    ttf: "/Library/Fonts",
  }
  : {
    otf: `${Bun.env.HOME}/.local/share/fonts/otf`,
    ttf: `${Bun.env.HOME}/.local/share/fonts/ttf`,
  };

async function moveFontFiles(baseDir: string): Promise<void> {
  const exts: readonly FontType[] = ["ttf", "otf"] as const;
  for (const ext of exts) {
    const dir = DESTINATION[ext];
    await $`mkdir -p ${dir}`;

    for await (const fontFile of Bun.glob(`${baseDir}/**/*.${ext}`)) {
      await $`mv -f ${fontFile.path} ${dir}/${fontFile.name}`;
    }
  }
}

async function downloadFont(): Promise<void> {
  const url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip";
  const zipName = url.split("/").pop() || "font.zip";

  const tmp = await $`mktemp -d`;
  const tmpPath = tmp.out.trim();
  await $`curl -L ${url} -o ${tmpPath}/${zipName}`;
  
  const unzipTo = `${tmpPath}/unzip`;
  await $`mkdir -p ${unzipTo}`;
  await $`unzip ${tmpPath}/${zipName} -d ${unzipTo}`;

  await moveFontFiles(unzipTo);
}

async function main(): Promise<void> {
  await downloadFont();
  await $`fc-cache -f -v`;
}

await main();
