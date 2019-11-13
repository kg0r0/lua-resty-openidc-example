local redis = require "resty.redis"
local red = redis:new()
red:set_timeout(3000)

local ok, err = red:connect("redis",6379)
if not ok then
  ngx.say("connection error: ",err)
  return
end

ngx.var.pass="http://127.0.0.1/contents"