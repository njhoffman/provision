# @ansible_home = "/home/vagrant/.ansible"

Vagrant.configure('2') do |config|
  config.vm.define 'local' do |local|
    local.vm.box = 'ubuntu/focal64'
    # 14.04: trusty, 16.04: xenial, 18.04: bionic, 20.04: focal
    local.vm.box_check_update = 'false'
    # config.vm.network :forwarded_port, guest: 9000, host: 9200
    # config.vm.network :forwarded_port, guest: 9001, host: 9201
    local.vm.provider 'virtualbox' do |vb|
      vb.memory = '1024'
    end

    local.vm.provision 'ansible_local' do |ansible|
      ansible.limit    = 'all'
      ansible.verbose  = false
      ansible.playbook = 'main.yml'

      roles_file = 'requirements.yml'

      if File.exist?(roles_file) && !Psych.load_file(roles_file).equal?(nil)
        ansible.galaxy_role_file  = roles_file
        ansible.galaxy_roles_path = '/home/vagrant/.ansible/roles/'
        ansible.galaxy_command    = 'ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path}'
      end
    end
  end
end
#
#-*- mode: ruby -*-
# vim:ft=ruby :
