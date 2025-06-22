# PXE for Debian 12 installation

Support computers which use UEFI boot mode.

## Usage
1. Revise `PXE/grub.cfg` and `PXE/preseed.txt` to fit your environment.
    * 59 line in `PXE/preseed.txt` needs to be changed to your desired root password generated from `openssl passwd`.
2. `bash setup.sh`
   * This will create the necessary files and directories for PXE booting.
   * This should be run on the TFTP server.
3. Set up a TFTP server to serve the files in the `tftpboot` directory.
4. Set up a DHCP server to point to the TFTP server and set boot file (`debian-installer/amd64/bootnetx64.efi`).
5. Boot the target computers from the network (PXE, you may need to revise BIOS setting).

In our case, we set `192.168.10.253` as the TFTP and DHCP server.

## Preseed file
* Use DHCP to get IP address and hostname.
* Use disk `/dev/sda` for installation.
    * Use `lvm` for partitioning.
* Debian mirror: `debian.cs.nycu.edu.tw`
* Timezone: `Asia/Taipei`
* Keyboard layout: `us`
