#!/bin/bash

# 入力ファイル
INPUT_FILE="student.txt"
# 出力ファイル
OUTPUT_FILE="hosts"

# ヘッダーを書き込む
echo "[target]" > "$OUTPUT_FILE"

# 各行を処理
while read -r name ip; do
  echo "${name} ansible_host=${ip} ansible_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa" >> "$OUTPUT_FILE"
done < "$INPUT_FILE"

echo "✅ hosts を生成しました"
