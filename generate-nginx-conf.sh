#!/bin/sh

# 确保输出目录存在
mkdir -p /etc/nginx/conf.d/

# 使用echo生成无BOM的配置文件
cat > /etc/nginx/conf.d/default.conf << 'EOF'
server {
    listen       80;
    server_name  localhost;
    
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        try_files \ \/ /index.html;
    }
    
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
EOF

# 启动nginx
exec nginx -g 'daemon off;'
