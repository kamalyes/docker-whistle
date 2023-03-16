# Docker版Whistle，不依赖宿主机nodejs版本

# 运行指令

1. 离线Dockerfile部署
```bash
docker build -t  kamalyes/whistle:v1.0.0 .
docker run --name whistle -p 8900:8900 -d kamalyes/whistle:v1.0.0
docker exec -it whistle  w2 start -p 8900
```

2. dockerHub仓库
```bash
docker-compose -f ./test/docker-compose.yml up -d
docker exec -it whistle  w2 start -p 8900
```

# 注意事项
```
若暴漏的端口与宿主机不一致时，许使用宿主机端口
```