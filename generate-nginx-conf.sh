#!/bin/sh

# ȷ�����Ŀ¼����
mkdir -p /etc/nginx/conf.d/

# ʹ��echo������BOM�������ļ�
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

# ����nginx
exec nginx -g 'daemon off;'
