#!/bin/bash
echo -e "See https://nsq.io/components/nsqd.html for options"
echo -e "-mem-queue-size int -> number of messages to keep in memory (per topic/channel) (default 10000)"
echo -e "messageSize -> size of message in bytes"
echo -e "batchsize -> size of MultiPublish"
echo -e "-mem-queue-size=0 means write to disk immediately\n\n"

echo -e "\n\n 1KB records, single record insertion, straight to disk"
GOMAXPROCS=1 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 0
sleep 5

GOMAXPROCS=2 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 0
sleep 5

GOMAXPROCS=4 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 0
sleep 5

GOMAXPROCS=8 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 0
sleep 5

echo -e "\n\n 1KB records, multi record insertion, straight to disk"
GOMAXPROCS=1 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 0
sleep 5

GOMAXPROCS=2 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 0
sleep 5

GOMAXPROCS=4 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 0
sleep 5

GOMAXPROCS=8 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 0
sleep 5


echo -e "\n\n 1KB records, single record insertion, 100 record watermark"
GOMAXPROCS=1 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 100
sleep 5

GOMAXPROCS=2 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 100
sleep 5

GOMAXPROCS=4 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 100
sleep 5

GOMAXPROCS=8 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1 100
sleep 5


echo -e "\n\n 1KB records, multi record insertion, 100 record watermark"
GOMAXPROCS=1 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 100
sleep 5

GOMAXPROCS=2 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 100
sleep 5

GOMAXPROCS=4 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 100
sleep 5

GOMAXPROCS=8 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 100 100
sleep 5


echo -e "\n\n Throughput with high memory and large batches"
GOMAXPROCS=1 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1000 1000000000
sleep 5

GOMAXPROCS=2 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1000 1000000000
sleep 5

GOMAXPROCS=4 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1000 1000000000
sleep 5

GOMAXPROCS=8 && echo -e "\nGOMAXPROCS=$GOMAXPROCS" && ./bench.sh 1000 1000 1000000000
sleep 5