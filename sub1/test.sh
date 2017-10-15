#!/bin/sh

for TEST in `find . -name 'test_*.sh'`
do
    echo $TEST

    . $TEST

    if [ ${RESULT} -eq 1 ]; then
        echo OK
    else
        echo NG
    fi
done

