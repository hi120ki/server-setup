Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "202302523.0.0"

  config.vm.define "ubuntu"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 8192
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    git clone https://github.com/hi120ki/lang-env.git
    ansible-playbook -c=local -i local, lang-env/base.yml
  SHELL

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "base.yml"
  end
end
