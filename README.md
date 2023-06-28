## vue-admin-starter

三个项目：
- admin-base：前端，包含基础管理后台功能
- admin-full：前端，包含基础管理后台功能、包含常用组件
- service：后端，包含数据存储，有两个服务
  - base：提供简单的管理后台菜单
  - full：完整的菜单管理


## 启动项目

### 前端项目

```sh
# admin-base，.env 使用 3100 端口
pnpm dev:base

# admin-full，.env 使用 3101 端口
pnpm dev:full
```


### 后端项目

1. 使用 docker 启动 mysql
```sh
# -f 指定的是 docker-compose.yml 文件的路径
docker-compose -f packages/service/docker-compose.yml up -d
```

> 启动后可以到 Navicat 查看数据库是否初始化成功


2. 启动 node 服务
```sh
# service base，使用端口 3200，配置文件在 .env.base 中
pnpm start:base

# service full，使用端口 3201，配置文件在 .env.full 中
pnpm start:full
```
