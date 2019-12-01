FROM openresty/openresty:alpine-fat
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY main.lua /usr/local/openresty/main.lua
COPY session.lua /usr/local/openresty/session.lua
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc
