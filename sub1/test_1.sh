#!/bin/sh

# 引数設定
url=${URL_DL}/test-data
filename=test

# verb呼び出し
verb_download


echo id=$id

progress=0
while [ ${progress} -lt 100 ]
do
    id=${DL_ID}
    verb_info
done




RESULT=1