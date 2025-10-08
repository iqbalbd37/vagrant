Vagrant Download Link 
https://releases.hashicorp.com/vagrant/2.4.9/

Check vagrant status
$vagrant global-status --prune


Vagrant Command Cheat Sheet
📁 Vagrant Directory Setup
# Navigate to your Vagrant working directory
cd ~/vagrant-cluster/shared

# Bring up the environment (create and start VMs)
vagrant up

💣 Destroy VMs
# Check running VMs and their IDs
vagrant status

# Destroy specific VMs (use the IDs from `vagrant status`)
cd /root/vagrant-cluster/shared
vagrant destroy 6532574
vagrant destroy 0687e7e
vagrant destroy ec3ee73

# Force destroy without confirmation
vagrant destroy -f 6532574
vagrant destroy -f 0687e7e
vagrant destroy -f ec3ee73

🔁 Reload Vagrant Machines
# Reload all machines
vagrant reload

# Reload a specific machine
vagrant reload <machine_name>

# Reload and re-run provisioning scripts
vagrant reload --provision

# Reload with debug output
vagrant reload --debug

🧹 Clean Up & Unlock Stuck VMs
Step 1: Kill VirtualBox Processes
ps aux | grep -i virtualbox
killall -9 VBoxHeadless VBoxSVC VBoxManage

Step 2: Unregister & Delete Stuck VMs
VBoxManage unregistervm "node1" --delete
VBoxManage unregistervm "node2" --delete
VBoxManage unregistervm "node3" --delete

Step 3: Clean Vagrant Cache
vagrant global-status --prune

Step 4: Verify Cleanup
VBoxManage list vms

🧽 Uninstalling Vagrant (Ubuntu/Debian)
Step 1: Check Installation
which vagrant
vagrant --version
dpkg -l | grep vagrant

Step 2: Remove Vagrant (APT)
apt remove --purge vagrant -y
rm -rf /opt/vagrant
rm -rf ~/.vagrant.d
rm -rf /usr/local/bin/vagrant
rm -rf /root/.vagrant.d

Step 3: If Installed Manually
rm -f /usr/local/bin/vagrant
rm -rf ~/.vagrant.d
rm -rf /root/.vagrant.d

Step 4: Clean Boxes and VMs
vagrant global-status --prune
vagrant box list | awk '{print $1}' | xargs -n1 vagrant box remove -f
rm -rf ~/.vagrant.d
rm -rf /root/.vagrant.d

Step 5: Verify Uninstall
vagrant --version

🌐 Miscellaneous Commands
# Show all known Vagrant environments
vagrant global-status

# Get more info on a specific VM
vagrant ssh <machine_name>

# Suspend and resume a VM
vagrant suspend
vagrant resume

✅ Quick Summary Table
Action	Command
Start VMs	vagrant up
Stop VMs	vagrant halt
Reload VMs	vagrant reload
Destroy VMs	vagrant destroy
List VMs	vagrant status
Clean cache	vagrant global-status --prune
SSH into VM	vagrant ssh <name>
Remove all boxes	vagrant box list | awk '{print $1}' | xargs -n1 vagrant box remove -f
