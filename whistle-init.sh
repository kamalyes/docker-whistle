#!/bin/bash
set -e

for index in script inspect vase sni-callback proxyauth set-req-len show-frames autopac modify; do
  echo -e "开始安装$index插件..."
  w2 install whistle.$index
  echo -e "$index安装完成..."
done

echo -e "启动容器...\n"
w2 start
echo -e "容器启动成功...\n"

echo -e "更多命令调用，请访问whistle官方文档：http://wproxy.org/whistle/options.html"

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

exec "$@"
