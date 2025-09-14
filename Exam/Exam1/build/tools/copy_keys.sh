#!/bin/bash

# パスワード（全ホスト共通）
PASSWORD=""

# 入力ファイル
INPUT="student.txt"

# sshpass がインストールされているか確認
if ! command -v sshpass &> /dev/null; then
  echo "❌ sshpass がインストールされていません。インストールしてください。"
  exit 1
fi

# 各行を処理
while read -r name ip; do
  echo "🔐 Copying SSH key to $name ($ip)..."
  sshpass -p "$PASSWORD" ssh-copy-id -o StrictHostKeyChecking=no root@"$ip"
done < "$INPUT"

echo "✅ すべてのホストに公開鍵をコピーしました"
