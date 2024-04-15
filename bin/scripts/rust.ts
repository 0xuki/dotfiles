import { $ } from "bun";

async function getCurrentDirectory(): Promise<string> { 
  const result = await $`pwd`; 

  return (await result.text()).trim();
}

async function buildAndTestRustProject(): Promise<void> {
  const projectDir = await getCurrentDirectory();
  console.log("Working in directory:", projectDir);
  console.log("Starting build...");
  console.log(await $`cargo build`);
  console.log("Running tests...");
  console.log(await $`cargo test`);
}

async function updateDependencies(): Promise<void> {
  const projectDir = await getCurrentDirectory();
  console.log("Updating Rust dependencies in", projectDir);
  console.log(await $`cargo update`);
}

async function setupCrossCompilation(target: string): Promise<void> {
  const projectDir = await getCurrentDirectory();
  console.log(`Setting up cross-compilation for target: ${target} in ${projectDir}`);
  console.log(await $`rustup target add ${target}`);
  console.log(await $`cargo build --target ${target}`);
}

async function profileRustApplication(executableName: string): Promise<void> {
  const projectDir = await getCurrentDirectory();
  console.log(`Profiling ${executableName} in ${projectDir}...`);
  console.log(await $`valgrind --tool=callgrind ./${executableName}`);
}


await buildAndTestRustProject();


