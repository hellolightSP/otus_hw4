**Практические навыки работы с ZFS**

**Задание**

Что нужно сделать?

1. Определить алгоритм с наилучшим сжатием.
2. Определить настройки pool’a.
- C помощью команды zfs import собрать pool ZFS;
- командами zfs определить настройки:
- размер хранилища;
- тип pool;
- значение recordsize;
- какое сжатие используется;
- какая контрольная сумма используется.
3. Найти сообщение от преподавателей.

**Выполнение:**

- VPN сервера не имею, поэтому необходимый образ скачиваю с сайта https://app.vagrantup.com/centos/boxes/7 через плагин vpn в браузере Chrome

- Добавляю вручную образ:
```
vagrant box add --name 'CentOS-7-x86_64-Vagrant-2004_01' /home/neon/Downloads/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box"
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'CentOS-7-x86_64-Vagrant-2004_01' (v0) for provider: 
    box: Unpacking necessary files from: file:///home/neon/Downloads/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box
==> box: Successfully added box 'CentOS-7-x86_64-Vagrant-2004_01' (v0) for 'virtualbox'!
root@neon-desktop:/test_vm# vagrant box list
CentOS-7-x86_64-Vagrant-2004_01 (virtualbox, 0)
```
- правлю под него Vagrantfile (во вложении) и запускаю командой 
```
vagrant up > otus_hw4_xfs
```
**Скрипты с выполнением ДЗ, и вывод всех команд в приложенных файлах: [config_zfs.sh](https://github.com/hellolightSP/otus_hw4/blob/main/config_zfs.sh), [install_packages.sh](https://github.com/hellolightSP/otus_hw4/blob/main/install_packages.sh), [otus_hw4_xfs](https://github.com/hellolightSP/otus_hw4/blob/main/otus_hw4_xfs)**

- show disk
```
lsblk
```
- Add kernel module zfs
```
modprobe zfs
```
- Config zfz pool
```
zpool create -f otus1 mirror /dev/sdb /dev/sdc
zpool create -f otus2 mirror /dev/sdd /dev/sde
zpool create -f otus3 mirror /dev/sdf /dev/sdg
zpool create -f otus4 mirror /dev/sdh /dev/sdi
zpool list
````

- status zfs pool
```
zpool status
```
- config compression
```
zfs set compression=lzjb otus1
zfs set compression=lz4 otus2
zfs set compression=gzip-9 otus3
zfs set compression=zle otus4
```
- show compression
```
zfs get all | grep compression
```

- test compression
```
for i in {1..4}; do wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done

ls -l /otus*
```
- show result
```
zfs list
zfs get all | grep compressratio | grep -v refotus1
```
- Определение настроек пула
```
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
```
- Работа со снапшотом, поиск сообщения от преподавателя
```
wget -O otus_task2.file --no-check-certificate 'https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download'

zfs receive otus/test@today < otus_task2.file

find /otus/test -name "secret_message"

cat /otus/test/task1/file_mess/secret_message
```
