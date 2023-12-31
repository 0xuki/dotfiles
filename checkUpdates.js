"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var child_process_1 = require("child_process");
var repoPath = '~/.config/nvim'; // Neovim設定のパス
var repoUrl = 'https://github.com/root309/nvim.git'; // リモートリポジトリURL
try {
    // ローカルリポジトリの最新コミットを取得
    var localCommit = (0, child_process_1.execSync)("git -C ".concat(repoPath, " rev-parse HEAD")).toString().trim();
    // リモートリポジトリの最新コミットを取得
    var remoteCommit = (0, child_process_1.execSync)("git ls-remote ".concat(repoUrl, " HEAD")).toString().split('\t')[0];
    if (localCommit !== remoteCommit) {
        console.log('Your local Neovim configuration is not up to date!');
        process.exit(1); // 更新が必要な場合は1を返す
    }
    else {
        console.log('Your local Neovim configuration is up to date.');
        process.exit(0); // 更新が不要な場合は0を返す
    }
}
catch (error) {
    console.error('An error occurred:', error);
    process.exit(1); // エラーが発生した場合は1を返す
}
