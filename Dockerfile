FROM node

# 创建 app 目录
WORKDIR /app

# 安装 app 依赖
RUN npm -g install serve
# 使用通配符复制 package.json 与 package-lock.json
#COPY package*.json ./

RUN npm install

# 打包 app 源码
COPY issp-overwatch /app
# 将 react、vue、angular 打包构建成静态文件
RUN npm run build

EXPOSE 9700
# 将 dist 目录部署于 8080 端口
CMD ["serve", "-s", "dist", "-p", "8080"]