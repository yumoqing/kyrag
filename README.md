# 开元rag

## 克隆仓库
执行下面的命令
```
git clone https://git.opencomputing.cn/yumoqing/kyrag.git
```
## 一键安装
安装前检查当前用户是否有sudo权限
```
cd kyrag
./build.sh
```

## 检查安装
```
ps -ef|grep kyrag.py
```

## 重启服务
```
sudo systemctl restart kyrag
```

## 功能
* 支持多客户
* 客户间的知识库隔离，相互不可见
* 每个用户可以创建一到多个知识库
* 知识图谱增强
* 使用可配置的服务：潜入模型，向量数据库，重排模型，三元组模型，图知识库，实体模型
* 原始文档管理
* 网上知识爬取以及爬取配置
