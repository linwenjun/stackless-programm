#!/usr/bin/env bash

docker build . -t stateless-programm:v1

COUNT=$(cat def.json| jq -r ".test | length")

for k in $( seq 1 $COUNT ); do
    idx=`expr $k - 1`
    echo "==========================================="
    echo "编译中..."

    ACTUAL=$(docker run --rm --name java-stateless-programm stateless-programm:v1 $(cat def.json| jq -r ".test[$idx].in"))

    echo "对比结果..."
    EXPORT=$(cat def.json| jq -r ".test[$idx].out")

    echo "期望: $EXPORT"
    echo "实际: $ACTUAL"

    if [[ $ACTUAL == $EXPORT ]]; then
        echo "匹配"
    else
        echo "不匹配"
        exit 1
    fi
done




