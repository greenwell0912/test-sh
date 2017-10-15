#!/bin/sh

IP=192.168.179.8
PORT=11111
URL=ec2-52-14-83-218.us-east-2.compute.amazonaws.com
TOKEN=init
SESSION=

RES=`curl http://${IP}:${PORT}/api/auth/connect?token=${TOKEN}`

echo ${RES}

TOKEN=`echo $RES | jq -r .request.token`
UUID=`echo $RES | jq -r .request.uuid`

echo ${TOKEN} ${UUID}

sleep 1

echo “curl http://${IP}:${PORT}/api/auth/check?token=${TOKEN}\&uuid=${UUID}”
RES=`curl http://${IP}:${PORT}/api/auth/check?token=${TOKEN}\&uuid=${UUID}`

STATUS=`echo $RES | jq .request.status`
echo ${STATUS}


RES=`curl http://${IP}:${PORT}/api/download/download?url=${URL}/test-data.txt\&filename=test\&token=${TOKEN}\&uuid=${UUID}`

echo ${RES}

ID=`echo $RES | jq -r .response.id`

echo ${ID}

PROG=0
while [ $PROG -lt 100 ]
do
    echo “================“
    RES=`curl http://${IP}:${PORT}/api/download/info?id=${ID}\&token=${TOKEN}\&uuid=${UUID}`
    echo $RES
    PROG=`echo $RES | jq -r .response.downloading.progress`
    echo progress=$PROG
done