FROM openresty/openresty:alpine-fat
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY sample.lua /usr/local/openresty/sample.lua
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc
