#!/bin/sh

IP=192.168.179.8
PORT=11111
URL_DL=ec2-52-14-83-218.us-east-2.compute.amazonaws.com
TOKEN=init
SESSION=
URL_API=http://${IP}:${PORT}/api
DL_ID=



verb_connect () {
    RESPONSE=`curl http://${IP}:${PORT}/api/auth/connect?token=${TOKEN}`
    TOKEN=`echo ${RESPONSE} | jq -r .request.token`
    UUID=`echo ${RESPONSE} | jq -r .request.uuid`
}

verb_download () {
    # リクエスト
    RESPONSE=`curl ${URL_API}/download/download?url=${url}\&filename=${filename}\&token=${TOKEN}\&uuid=${UUID}`

    # レスポンス格納
    id=`echo ${RESPONSE} | jq -r .response.id`

    # 共通変数格納
    DL_ID=${id}
}

verb_info () {
    # リクエスト
    echo id=${id}
    RESPONSE=`curl ${URL_API}/download/info?id=${id}\&token=${TOKEN}\&uuid=${UUID}`

    # レスポンス格納
    id=`echo ${RESPONSE} | jq -r .response.downloading.id`
    progress=`echo ${RESPONSE} | jq -r .response.downloading.progress`
}

