#!/bin/sh

# 使用sed命令删除BOM字符
if [ -f /etc/nginx/conf.d/default.conf ]; then
  # 删除UTF-8 BOM标记 (EF BB BF)
  sed -i '1s/^\xEF\xBB\xBF//' /etc/nginx/conf.d/default.conf
fi

# 启动nginx
exec nginx -g 'daemon off;'
