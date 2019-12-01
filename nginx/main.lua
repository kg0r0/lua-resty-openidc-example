local redis = require "resty.redis"
local red = redis:new()

local ok, err = red:connect("redis", 6379)
if not ok then
    ngx.say("connection error: ", err)
    return
end

local cookie = ngx.var.cookie_sid
local res, err = red:get(cookie)
if res then
    ngx.var.pass = "http://127.0.0.1/contents"
    return
end

local opts = {
    ssl_verify = "no",
    redirect_uri = "http://localhost/private/callback",
    discovery = "http://keycloak:8080/auth/realms/demo/.well-known/openid-configuration",
    client_id = "sample-app",
    client_secret = "d59cc875-2546-4bc6-81a9-f34ceb82f662"
}

local res, err = require("resty.openidc").authenticate(opts)
if err then
    ngx.log(ngx.ERR, err)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end
ngx.req.set_header("X-USER", res.id_token.sub)

local session_val = "dummy"
ok, err = red:setex(session_val, 100, res.id_token.sub)
if not ok then
    ngx.say("failed to set: ", err)
    return
end
ngx.header['Set-Cookie'] = "sid=" .. session_val .. "; path=/"
ngx.var.pass = "http://127.0.0.1/contents"