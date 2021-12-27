# lua-resty-openidc-example
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![docker-compose](https://github.com/kg0r0/lua-resty-openidc-example/actions/workflows/main.yml/badge.svg)](https://github.com/kg0r0/lua-resty-openidc-example/actions/workflows/main.yml)

## Table of Contents
- [Overview](#overview)
- [Run](#run)
- [Usage](#usage)
- [Info](#info)
- [References](#references)

## Overview
Implementation of NGINX as relying party for OpenID Connect authentication :traffic_light:

![lua_resty_openidc_diagram](https://user-images.githubusercontent.com/33596117/71304146-e3974700-2405-11ea-86bb-66f1119447ab.png)

## Run
```
$ docker-compose build
$ docker-compose up -d
```

## Usage

### Local
1. Add below in hosts file.
```
127.0.0.1	localhost keycloak
```
2. Acccess to ``http://localhost`` .

3. Input user name and password.

## Info
### master realm
|user name  |password  |
|---|---|
|admin  |password  |

### demo realm
|user name  |password  |
|---|---|
|user  |password  |

## References
- https://github.com/zmartzone/lua-resty-openidc
- https://github.com/nginxinc/nginx-openid-connect
- https://github.com/bungle/lua-resty-session
