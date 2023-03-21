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
vagrant box add --name 'CentOS-7-x86_64-Vagrant-1804_02' /home/neon/Downloads/CentOS-7-x86_64-Vagrant-1804_02.VirtualBox.box"
```
3. правлю под него Vagrantfile (во вложении) и запускаю командой 
```
vagrant up
```
4. Все действия по выполнению залогировал утилитой script
```
scritp otus_hw3
```

otus_hw3 файл во вложении.





vagrant box add --name 'CentOS-7-x86_64-Vagrant-2004_01' /home/neon/Downloads/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'CentOS-7-x86_64-Vagrant-2004_01' (v0) for provider: 
    box: Unpacking necessary files from: file:///home/neon/Downloads/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box
==> box: Successfully added box 'CentOS-7-x86_64-Vagrant-2004_01' (v0) for 'virtualbox'!
root@neon-desktop:/test_vm# vagrant box list
CentOS-7-x86_64-Vagrant-2004_01 (virtualbox, 0)
