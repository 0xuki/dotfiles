use std::process::Command;
use std::str;

fn main() {
    let local_commit_output = Command::new("git")
        .args(&["rev-parse", "HEAD"])
        .output()
        .expect("Failed to execute git command");

    let local_commit = str::from_utf8(&local_commit_output.stdout)
        .expect("Invalid UTF-8")
        .trim();

    let remote_commit_output = Command::new("git")
        .args(&["ls-remote", "https://github.com/root309/nvim.git", "HEAD"])
        .output()
        .expect("Failed to execute git command");

    let remote_commit = str::from_utf8(&remote_commit_output.stdout)
        .expect("Invalid UTF-8")
        .trim()
        .split_whitespace()
        .next()
        .expect("No remote commit found");

    if local_commit == remote_commit {
        println!("Your Neovim configuration is up to date.");
    } else {
        println!("Your Neovim configuration is not up to date!");
    }
}
