#!/bin/bash

# 颜色定义（方便看输出）
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # 重置颜色

# 第一步：检查是否在 Git 仓库目录
if [ ! -d ".git" ]; then
    echo -e "${RED}[错误] 未找到 .git 文件夹，请在项目根目录运行此脚本！${NC}"
    exit 1
fi

echo -e "${YELLOW}[1/4] 正在添加所有文件...${NC}"
git add .
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[成功] 文件添加完成${NC}"
else
    echo -e "${RED}[失败] 文件添加失败，请手动检查${NC}"
    exit 1
fi

echo -e "${YELLOW}[2/4] 正在提交代码...${NC}"
git commit -m "修复一些小问题"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[成功] 代码提交完成${NC}"
else
    # 没有修改时提交会失败，这里做兼容
    echo -e "${YELLOW}[提示] 没有需要提交的修改，跳过提交${NC}"
fi

echo -e "${YELLOW}[3/4] 正在强制推送到远程 main 分支...${NC}"
git push -f origin main
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[成功] 代码推送完成！${NC}"
else
    echo -e "${RED}[失败] 推送失败，请检查网络或远程地址${NC}"
    exit 1
fi

echo -e "${GREEN}====================================${NC}"
echo -e "${GREEN}[全部完成] 代码已成功推送到 GitHub！${NC}"
echo -e "${GREEN}====================================${NC}"
