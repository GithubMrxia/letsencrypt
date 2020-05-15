# Let's Encrypt 免费证书申请

> 基于[acme.sh](https://github.com/acmesh-official/acme.sh)，用`docker alpine` 镜像封装了一下

- 使用 `dns` 验证，可以避免没有`80`、`443`端口的尴尬
- 可以添加多个域名，同时申请证书
- 域名服务商目前只支持阿里云，其他服务商可以通过修改`docker-entrypoint.sh`里的参数，重新构建镜像支持
- 支持导出证书到指定目录，并执行自定义脚本，例如重启`nginx`
- 定时脚本更新证书


## 配置

1. 复制 `.env.example` 为 `.env`，配置相关参数
2. 复制 `acme.ch/account.conf.example` 为 `acme.ch/account.conf`，如无必要建议只修改 `ACCOUNT_EMAIL`参数
