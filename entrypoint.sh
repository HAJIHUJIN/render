#!/bin/sh

# 设置伪装环境变量
export NODE_ENV="production"
echo "Starting Web Application & API Gateway..."

# 1. 在后台启动静态网页服务器 (监听本地 8081 端口)
cd /app
python3 -m http.server 8081 > /dev/null 2>&1 &

# 2. 启动 Sing-box 代理进程 (监听 8080 端口)
/usr/local/bin/node-runtime run -c /app/app.settings.data &

sleep 2

# 3. 启动 Cloudflare Argo 隧道 (同时配置网页与节点的转发路径)
TOKEN="eyJhIjoiN2FhOWNmYTFkMDViOGYwMjY4NzYwNzRkNzBkNjI3MTgiLCJ0IjoiMmFiNDUzZTgtNTczNy00MzE0LThjNDEtODE1MTVjMzUxMGViIiwicyI6Ik9UWmxNV000WWpJdE5UQXlPQzAwTnpObExUbGlZVFF0TVdJeVlqWmpZVFEwTmpRMCJ9"

echo "Connecting application gateway agent..."
exec /usr/local/bin/tunnel-agent tunnel --no-autoupdate run --token "$TOKEN"
