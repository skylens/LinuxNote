# macOS VMware Fusion

[Modifying the DHCP settings of vmnet1 and vmnet8 in Fusion (1026510)](https://kb.vmware.com/s/article/1026510)

```sh
sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --configure
sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --stop
sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --start
```