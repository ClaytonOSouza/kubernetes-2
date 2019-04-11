# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = {
	'master' => {'memory' => '2048', 'cpus' => '2', 'ip' => '10', 'provision' => 'master.sh'},
	'minion1' => {'memory' => '1024', 'cpus' => '1', 'ip' => '20', 'provision' => 'minion.sh'},
	'minion2' => {'memory' => '1024', 'cpus' => '1', 'ip' => '30', 'provision' => 'minion.sh'},
	'minion3' => {'memory' => '512', 'cpus' => '1', 'ip' => '40', 'provision' => 'minion.sh'}
}

Vagrant.configure('2') do |config|

	config.vm.box = 'debian/stretch64'
	config.vm.box_check_update = false

	vms.each do |name, conf|
		config.vm.define "#{name}" do |k|
		k.vm.hostname = "#{name}.k8s.com"
		k.vm.network 'private_network', ip: "192.168.10.#{conf['ip']}"
		k.vm.provider 'virtualbox' do |vb|
			vb.memory = conf['memory']
			vb.cpus = conf['cpus']
		end
		k.vm.provision 'shell', path: "provision/#{conf['provision']}", args: "#{conf['ip']}"
		end
	end

	config.vm.provision 'shell', path: 'provision/provision.sh'
end
