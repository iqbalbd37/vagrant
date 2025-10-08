
# 🧰 Vagrant Command Cheat Sheet

---

## 📁 Vagrant Directory Setup

```bash
cd ~/vagrant-cluster/shared
vagrant up
```

---

## 💣 Destroy VMs

```bash
vagrant status
cd /root/vagrant-cluster/shared
vagrant destroy 6532574
vagrant destroy 0687e7e
vagrant destroy ec3ee73

vagrant destroy -f 6532574
vagrant destroy -f 0687e7e
vagrant destroy -f ec3ee73
```

---

## 🔁 Reload Vagrant Machines

```bash
vagrant reload
vagrant reload <machine_name>
vagrant reload --provision
vagrant reload --debug
```

---

## 🧹 Clean Up & Unlock Stuck VMs

```bash
ps aux | grep -i virtualbox
killall -9 VBoxHeadless VBoxSVC VBoxManage

VBoxManage unregistervm "node1" --delete
VBoxManage unregistervm "node2" --delete
VBoxManage unregistervm "node3" --delete

vagrant global-status --prune
VBoxManage list vms
```

---

## 🧽 Uninstalling Vagrant (Ubuntu/Debian)

```bash
which vagrant
vagrant --version
dpkg -l | grep vagrant

apt remove --purge vagrant -y
rm -rf /opt/vagrant ~/.vagrant.d /usr/local/bin/vagrant /root/.vagrant.d

vagrant global-status --prune
vagrant box list | awk '{print $1}' | xargs -n1 vagrant box remove -f

vagrant --version
```

---

## 🌐 Miscellaneous Commands

```bash
vagrant global-status
vagrant ssh <machine_name>
vagrant suspend
vagrant resume
```

---

## ✅ Quick Summary Table

| Action | Command |
|--------|----------|
| Start VMs | `vagrant up` |
| Stop VMs | `vagrant halt` |
| Reload VMs | `vagrant reload` |
| Destroy VMs | `vagrant destroy` |
| List VMs | `vagrant status` |
| Clean cache | `vagrant global-status --prune` |
| SSH into VM | `vagrant ssh <name>` |
| Remove all boxes | `vagrant box list \| awk '{print $1}' \| xargs -n1 vagrant box remove -f` |
