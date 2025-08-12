Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2004"
  config.vm.define "ansiblemanagment" do |vm|
    vm.vm.hostname = "ansiblemanagment"
    vm.vm.network "private_network", type: "dhcp"
    vm.vm.provider "virtualbox" do |vb|
      vb.name = "ansiblemanagment"
      vb.memory = 4096
      vb.cpus = 4  
    end
  end
end
