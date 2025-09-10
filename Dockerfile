# 使用官方ZAP镜像作为基础
FROM zaproxy/zap-stable:2.16.1

# 切换到root用户来执行更新命令
USER root

# 更新包列表并升级所有包（清理缓存以减少镜像大小）
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 确保切换回ZAP运行时使用的非root用户（通常为zap或1000）
USER zap
