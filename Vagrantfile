# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
  "db" => {"memory" => "2048", "cpu" => "1", "ip" => "4", "image" => "debian/buster64"},
  "app1" => {"memory" => "512", "cpu" => "2", "ip" => "5", "image" => "debian/buster64"},
  "app2" => {"memory" => "512", "cpu" => "2", "ip" => "6", "image" => "centos/7"},
}

Vagrant.configure("2") do |config|
  config.vm.box_check_update = true
  #config.vm.synced_folder ".", "/vagrant", disabled: true
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.4linux.com"
      machine.vm.network "private_network", ip: "10.46.60.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
      end
      machine.vm.provision "shell", inline: "sudo apt install python3 -y"
      machine.vm.provision "shell", inline: "sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1"
      machine.vm.provision "shell", inline: "echo '#{name}.4labs.example' > /etc/hostname"
      machine.vm.provision "shell", inline: "hostnamectl set-hostname #{name}.4labs.example"
    end
  end
  config.vm.provision "shell", path: "provision/script.sh"
end
