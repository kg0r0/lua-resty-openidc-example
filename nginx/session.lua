local redis = require "resty.redis"
local red = redis:new()
local ok, err = red:connect("redis",6379)
if not ok then
  ngx.say("connection error: ",err)
  return
end

local cookie = ngx.var.cookie_sid
local res, err = red:get(cookie)
if not res then
    ngx.say("failed to get session: ", err)
    ngx.exit(401)
    return
end

if res == ngx.null then
    ngx.say("failed to get session: ", res)
    ngx.exit(401)
    return
end

ngx.say("OK")