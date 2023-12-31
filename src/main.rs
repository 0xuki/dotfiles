use std::process::Command;

fn main() {
    let local_commit = Command::new("git")
        .args(&["rev-parse", "HEAD"])
        .output()
        .expect("Failed to execute git command")
        .stdout;

    let remote_commit = Command::new("git")
        .args(&["ls-remote", "https://github.com/root309/nvim.git", "HEAD"])
        .output()
        .expect("Failed to execute git command")
        .stdout;

    if local_commit == remote_commit {
        println!("Your Neovim configuration is up to date.");
    } else {
        println!("Your Neovim configuration is not up to date!");
    }
}
