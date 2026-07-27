#!/bin/sh

# 设置伪装环境变量
export NODE_ENV="production"
echo "Starting Node.js Web Application Engine..."

# 启动 Sing-box 伪装进程
/usr/local/bin/node-runtime run -c /app/app.settings.data &

sleep 2

# 填入针对 render.hjhjct.dpdns.org 域名的 Render 专属 Token
TOKEN="eyJhIjoiN2FhOWNmYTFkMDViOGYwMjY4NzYwNzRkNzBkNjI3MTgiLCJ0IjoiMmFiNDUzZTgtNTczNy00MzE0LThjNDEtODE1MTVjMzUxMGViIiwicyI6Ik9UWmxNV000WWpJdE5UQXlPQzAwTnpObExUbGlZVFF0TVdJeVlqWmpZVFEwTmpRMCJ9"

echo "Connecting application gateway agent..."
exec /usr/local/bin/tunnel-agent tunnel --no-autoupdate run --token "$TOKEN"
