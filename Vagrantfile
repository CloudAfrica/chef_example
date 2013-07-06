
Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.forward_port 80, 4567

   config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "main::default"
  end
   
end
