#!/usr/bin/env bash

for i in {1..150}
do
  mysql -h 192.168.57.73 -uroot -proot -e 'select sleep(298);' > /dev/null &
  sleep 2
done
