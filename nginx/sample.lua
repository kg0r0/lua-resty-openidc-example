local redis = require "resty.redis"
local red = redis:new()
red:set_timeout(3000)

local opts = {
  ssl_verify = "no",
  redirect_uri = "https://MY_HOST_NAME/redirect_uri",
  discovery = "https://accounts.google.com/.well-known/openid-configuration",
  client_secret = "<client_secret>"
}

local res, err = require("resty.openidc").authenticate(opts)
if err then
  ngx.status = 500
  ngx.say(err)
  ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end
ngx.req.set_header("X-USER", res.id_token.sub)

local ok, err = red:connect("redis",6379)
if not ok then
  ngx.say("connection error: ",err)
  return
end

ngx.var.pass="http://127.0.0.1/contents"