#!/bin/sh

IP=192.168.3.3
PORT=11111
URL=https://www.google.co.jp/
TOKEN=init
SESSION=

HTTP_RESPONSE=`curl -s ${URL} -o /dev/null -w "%{http_code}\n"`
if [ ${HTTP_RESPONSE} -eq 200 ]; then
    echo "OK"
else
    echo ${HTTP_RESPONSE}
fi

#$ curl http://$\{IP\}:$\{PORT\}/api/auth/connect?token=$TOKEN
RES='{"jtype": "afb-reply","request": {"status": "success","token": "0aef6841-2ddd-436d-b961-ae78da3b5c5f","uuid": "850c4594-1be1-4e9b-9fcc-38cc3e6ff015"},"response": {"token": "A New Token and Session Context Was Created"}'}

TOKEN=`echo $RES | jq .request.token`
UUID=`echo $RES | jq .request.token`

echo $TOKEN $UUID}