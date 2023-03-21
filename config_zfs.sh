#!/bin/bash

#show disk
echo 'lsblk'
lsblk

#Add kernel module zfs
modprobe zfs
#Config zfz pool
zpool create -f otus1 mirror /dev/sdb /dev/sdc
zpool create -f otus2 mirror /dev/sdd /dev/sde
zpool create -f otus3 mirror /dev/sdf /dev/sdg
zpool create -f otus4 mirror /dev/sdh /dev/sdi
zpool list
echo "zpool config complite, run 'vagrant ssh' to connect VM"

#status zfs pool
zpool status

#config compression
zfs set compression=lzjb otus1
zfs set compression=lz4 otus2
zfs set compression=gzip-9 otus3
zfs set compression=zle otus4

#show compression
zfs get all | grep compression

#test compression
for i in {1..4}; do wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done

ls -l /otus*

#show result
zfs list
zfs get all | grep compressratio | grep -v refotus1


#Определение настроек пула

wget -O archive.tar.gz --no-check-certificate 'https://drive.google.com/u/0/uc?id=1KRBNW33QWqbvbVHa3hLJivOAt60yukkg&export=download'

tar -xzvf archive.tar.gz

zpool import -d zpoolexport/

zpool import -d zpoolexport/ otus

zpool status

zpool get all otus

zfs get available otus

zfs get readonly otus

zfs get recordsize otus

zfs get compression otus

zfs get checksum otus

#Работа со снапшотом, поиск сообщения от преподавателя

wget -O otus_task2.file --no-check-certificate 'https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download'

zfs receive otus/test@today < otus_task2.file

find /otus/test -name "secret_message"

cat /otus/test/task1/file_mess/secret_message
