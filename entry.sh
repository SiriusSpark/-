#!/bin/sh

# ʹ��sed����ɾ��BOM�ַ�
if [ -f /etc/nginx/conf.d/default.conf ]; then
  # ɾ��UTF-8 BOM��� (EF BB BF)
  sed -i '1s/^\xEF\xBB\xBF//' /etc/nginx/conf.d/default.conf
fi

# ����nginx
exec nginx -g 'daemon off;'
