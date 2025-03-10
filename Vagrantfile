# -*- mode: ruby -*-
# vim: set ft=ruby :
disk_controller = 'IDE' # MacOS. This setting is OS dependent. Details https://github.com/hashicorp/vagrant/issues/8105

MACHINES = {
  :zfs => {
        :box_name => "CentOS-7-x86_64-Vagrant-2004_01",
        :box_version => "0",
        :provision => "config_zfs.sh",
    :disks => {
        :sata1 => {
            :dfile => './sata6.vdi',
            :size => 512,
            :port => 1
        },
        :sata2 => {
            :dfile => './sata7.vdi',
            :size => 512, # Megabytes
            :port => 2
        },
        :sata3 => {
            :dfile => './sata8.vdi',
            :size => 512,
            :port => 3
        },
        :sata4 => {
            :dfile => './sata9.vdi',
            :size => 512, 
            :port => 4
        },
        :sata5 => {
            :dfile => './sata10.vdi',
            :size => 512,
            :port => 5
        },
        :sata6 => {
            :dfile => './sata11.vdi',
            :size => 512,
            :port => 6
        },
        :sata7 => {
            :dfile => './sata12.vdi',
            :size => 512, 
            :port => 7
        },
        :sata8 => {
            :dfile => './sata13.vdi',
            :size => 512, 
            :port => 8
        }
    }
        
  },
}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
      config.vm.define boxname do |box|
        box.vm.box = boxconfig[:box_name]
#        box.vm.boxvag_version = boxconfig[:box_version]
        box.vm.host_name = "zfs"
        box.vm.provider :virtualbox do |vb|
              vb.customize ["modifyvm", :id, "--memory", "1024"]
              needsController = false
        boxconfig[:disks].each do |dname, dconf|
              unless File.exist?(dconf[:dfile])
              vb.customize ['createhd', '--filename', dconf[:dfile], '--variant', 'Fixed', '--size', dconf[:size]]
         needsController =  true
         end
        end
            if needsController == true
                vb.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
                boxconfig[:disks].each do |dname, dconf|
                vb.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', dconf[:port], '--device', 0, '--type', 'hdd', '--medium', dconf[:dfile]]
                end
             end
          end
        box.vm.provision "shell", path: "install_packages.sh"
        box.vm.provision "shell", reboot: true
        box.vm.provision "shell", path: boxconfig[:provision]
    end
  end
end
