# WebBetter

netkeibaの俺プロに予想を投稿するAPIです。

## Installation

```
$ docker-compose build
$ docker-compose up -d
```

## How to use

### 俺プロ予想投稿API

- POST `/api/netkeiba/orepro/v1/predictions`

|name|type|required|description|example|
|---|---|---|---|---|
|email|string|true|netkeibaアカウントのメールアドレス|example@gmail.com|
|password|string|true|netkeibaアカウントのパスワード|example1234|
|race_id|integer|true|netkeibaのレースID|202130081211|
|honmei|integer|true|本命馬の馬番|1|
|taikou|integer|false|対抗馬の馬番|2|
|tanana|integer|false|単穴馬の馬番|3|
|renkas|Array<integer>|false|連下馬の馬番|[4, 5]|


リクエスト例

```curl
curl -X POST http://localhost:3000/api/netkeiba/orepro/v1/predictions -d 'email=YOUR_EMAIL&password=YOUR_PASSWORD&race_id=202130081211&honmei=1&taikou=2&tanana=3&renkas[]=4&renkas[]=5'
``` 

レスポンス例

```json
{ "status":200, "message": "http://localhost:3000/capybara-202108150700382364758095.png" }
```