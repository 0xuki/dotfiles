import { execSync } from 'child_process';

const repoPath = '~/.config/nvim'; // Neovim設定のパス
const repoUrl = 'https://github.com/root309/nvim.git'; // リモートリポジトリURL

try {
  // ローカルリポジトリの最新コミットを取得
  const localCommit = execSync(`git -C ${repoPath} rev-parse HEAD`).toString().trim();

  // リモートリポジトリの最新コミットを取得
  const remoteCommit = execSync(`git ls-remote ${repoUrl} HEAD`).toString().split('\t')[0];

  if (localCommit !== remoteCommit) {
    console.log('Your local Neovim configuration is not up to date!');
    process.exit(1); // 更新が必要な場合は1を返す
  } else {
    console.log('Your local Neovim configuration is up to date.');
    process.exit(0); // 更新が不要な場合は0を返す
  }
} catch (error) {
  console.error('An error occurred:', error);
  process.exit(1); // エラーが発生した場合は1を返す
}

