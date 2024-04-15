import { $ } from "bun";

async function diagnoseEnvironment(): Promise<void> {
  console.log("Checking system info...");
  console.log(await $`uname -mrs`);
  console.log("Checking installed languages...");
  console.log(await $`python3 --version`);
  console.log(await $`node --version`);
  console.log(await $`rustc --version`);
  console.log(await $`cargo --version`);
  console.log(await $`zig -version`);
  console.log(await $`llvm --version`);
  console.log(await $`gcc --version`);
  console.log(await $`g++ --version`);
  console.log(await $`bun --version`);
  console.log(await $`deno --version`);
    
  

  console.log(await $`go version`);
  console.log(await $`Checking editor info`);
  console.log(await $`nvim --version`);
  console.log(await $`vim --version`);

  console.log("Checking disk usage...");
  console.log(await $`df -h`);
}

await diagnoseEnvironment();
