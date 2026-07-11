#!/bin/bash

# 用法: ./import-overleaf.sh <overleaf解壓縮後的資料夾路徑> <crash-course裡的子資料夾名稱>
# 範例: ./import-overleaf.sh ~/Downloads/T2-MCQs-ans T2-MCQs-ans

set -e

SOURCE=$1
DEST_NAME=$2

if [ -z "$SOURCE" ] || [ -z "$DEST_NAME" ]; then
    echo "用法: ./import-overleaf.sh <來源資料夾> <目的地名稱>"
    exit 1
fi

DEST="crash-course/$DEST_NAME"

echo "建立目的地資料夾: $DEST"
mkdir -p "$DEST"

echo "同步檔案 (排除 .git 和 .DS_Store)..."
rsync -av --exclude='.git' --exclude='.DS_Store' "$SOURCE/" "$DEST/"

echo "完成，檔案已放入: $DEST"
ls -la "$DEST"
