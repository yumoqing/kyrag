---
name: kyrag-repo
version: 1.0.0
description: 开元rag — 使用可配置的服务：潜入模型，向量数据库，重排模型，三元组模型，图知识库，实体模型
trigger_conditions:
  - 需要理解、修改或排障 kyrag 的代码
  - 在 kyrag 里定位入口、数据表、对外契约或构建方式
---

# kyrag 仓库技能

> 由仓库实际内容生成的骨架（README/目录/模型定义/契约/构建脚本逐项取证）。新增判断与坑位请直接在下面对应小节补充。

## 定位

**开元rag**

* 使用可配置的服务：潜入模型，向量数据库，重排模型，三元组模型，图知识库，实体模型

- 远端：`https://github.com/yumoqing/kyrag.git`
- 默认分支：`main`（共 46 个提交）
- 最近提交：2026-11-03 `3787995` chore: 忽略构建/测试临时文件
- 规模：19 个文件；Shell 1，Python 1，JSON 1

## 目录结构

- `wwwroot/` — 前端页面与 `.dspy` 契约（服务端渲染入口）（11 个文件）
- `app/` — 应用级初始化 / 菜单与页面装配（1 个文件）
- `conf/` — 配置（`config.json`；密码为 AES 密文）（1 个文件）
- `files/` — 静态文件（1 个文件）
- `logs/` — 1 个文件
- 根文件：`.gitignore`、`README.md`、`build.sh`、`requirements.txt`

## 对外契约（`.dspy`，2 个）

- `wwwroot/test/uapi/`：1 个 — index.dspy
- `wwwroot/v1/jump-in/`：1 个 — index.dspy

## 构建与运行

- `build.sh`（一键部署）
- `requirements.txt`：4 项（git+https://git.opencomputing.cn/yumoqing/apppublic、git+https://git.opencomputing.cn/yumoqing/sqlor、git+https://git.opencomputing.cn/yumoqing/ahserver、git+https://git.opencomputing.cn/yumoqing/bricks-for-python）

## README 要点与注意（摘自 `README.md`）

- 章节：克隆仓库、一键安装、检查安装、重启服务、功能

## 建议阅读顺序

1. `README.md`
2. `build.sh`
3. `wwwroot/`

