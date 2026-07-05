# Audit global Ubuntu Hardening AIS v4.0.0
Date : dim. 05 juil. 2026 17:08:39 CEST

## Système
```
 Static hostname: pcubuntu
       Icon name: computer-desktop
         Chassis: desktop
      Machine ID: 492ce8f9bf8846edb282fd79411fa6ec
         Boot ID: 2ee3c1b74d8248b78537562bdbe856d5
Operating System: Ubuntu 22.04.5 LTS
          Kernel: Linux 6.8.0-124-generic
    Architecture: x86-64
 Hardware Vendor: MSI
  Hardware Model: MS-7666
```

## Services échoués
```
  UNIT             LOAD   ACTIVE SUB    DESCRIPTION
● rc-local.service loaded failed failed /etc/rc.local Compatibility
● snort.service    loaded failed failed LSB: Lightweight network intrusion detection system

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
2 loaded units listed.
```

## UFW
```
État : actif
Journalisation : on (low)
Par défaut : deny (incoming), allow (outgoing), deny (routed)
Nouveaux profils : skip

Vers                       Action      De
----                       ------      --
22/tcp                     ALLOW IN    Anywhere                   # SSH
80/tcp                     ALLOW IN    Anywhere                   # HTTP
443/tcp                    ALLOW IN    Anywhere                   # HTTPS
2375/tcp                   ALLOW IN    Anywhere                   # Docker
22/tcp (v6)                ALLOW IN    Anywhere (v6)              # SSH
80/tcp (v6)                ALLOW IN    Anywhere (v6)              # HTTP
443/tcp (v6)               ALLOW IN    Anywhere (v6)              # HTTPS
2375/tcp (v6)              ALLOW IN    Anywhere (v6)              # Docker

```

## Fail2ban SSH
```
Status for the jail: sshd
|- Filter
|  |- Currently failed:	0
|  |- Total failed:	0
|  `- Journal matches:	_SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned:	0
   |- Total banned:	0
   `- Banned IP list:	
```

## AppArmor
```
apparmor module is loaded.
130 profiles are loaded.
104 profiles are in enforce mode.
   /snap/snapd/26865/usr/lib/snapd/snap-confine
   /snap/snapd/27406/usr/lib/snapd/snap-confine
   /usr/bin/evince
   /usr/bin/evince-previewer
   /usr/bin/evince-previewer//sanitized_helper
   /usr/bin/evince-thumbnailer
   /usr/bin/evince//sanitized_helper
   /usr/bin/evince//snap_browsers
   /usr/bin/freshclam
   /usr/bin/lxc-start
   /usr/bin/man
   /usr/lib/NetworkManager/nm-dhcp-client.action
   /usr/lib/NetworkManager/nm-dhcp-helper
   /usr/lib/connman/scripts/dhclient-script
   /usr/lib/cups/backend/cups-pdf
   /usr/lib/snapd/snap-confine
   /usr/sbin/clamd
   /usr/sbin/cups-browsed
   /usr/sbin/cupsd
   /usr/sbin/cupsd//third_party
   /usr/sbin/sssd
   /{,usr/}sbin/dhclient
   ippusbxd
   libreoffice-senddoc
   libreoffice-soffice//gpg
   libreoffice-xpdfimport
   libvirtd
   libvirtd//qemu_bridge_helper
   lsb_release
   lxc-container-default
   lxc-container-default-cgns
   lxc-container-default-with-mounting
   lxc-container-default-with-nesting
   man_filter
   man_groff
   nvidia_modprobe
   nvidia_modprobe//kmod
   snap-update-ns.code
   snap-update-ns.deezer-lite-player
   snap-update-ns.evince
   snap-update-ns.firefox
   snap-update-ns.gnome-system-monitor
   snap-update-ns.krdc
   snap-update-ns.mesa-2404
   snap-update-ns.notepad-plus-plus
   snap-update-ns.opera
   snap-update-ns.powershell
   snap-update-ns.snapd-desktop-integration
   snap-update-ns.teams-for-linux
   snap-update-ns.winrar
   snap.deezer-lite-player.deezer-lite-player
   snap.deezer-lite-player.hook.configure
   snap.evince.evince
   snap.evince.evince-previewer
   snap.evince.evince-thumbnailer
   snap.evince.hook.configure
   snap.firefox.firefox
   snap.firefox.geckodriver
   snap.firefox.hook.configure
   snap.firefox.hook.disconnect-plug-host-hunspell
   snap.firefox.hook.install
   snap.firefox.hook.post-refresh
   snap.gnome-system-monitor.gnome-system-monitor
   snap.gnome-system-monitor.hook.configure
   snap.krdc.hook.configure
   snap.krdc.krdc
   snap.mesa-2404.component-monitor
   snap.mesa-2404.hook.connect-plug-kernel-gpu-2404
   snap.mesa-2404.hook.disconnect-plug-kernel-gpu-2404
   snap.mesa-2404.hook.install
   snap.mesa-2404.hook.post-refresh
   snap.notepad-plus-plus.hook.configure
   snap.notepad-plus-plus.notepad-plus-plus
   snap.notepad-plus-plus.wine
   snap.notepad-plus-plus.winetricks
   snap.opera.hook.configure
   snap.opera.opera
   snap.snapd-desktop-integration.hook.configure
   snap.snapd-desktop-integration.snapd-desktop-integration
   snap.teams-for-linux.teams-for-linux
   snap.winrar.hook.configure
   snap.winrar.wcf
   snap.winrar.wef
   snap.winrar.wefs
   snap.winrar.weh
   snap.winrar.wine
   snap.winrar.winetricks
   snap.winrar.winrar
   snap.winrar.wqc
   snap.winrar.wra
   snap.winrar.wta
   swtpm
   tcpdump
   ubuntu_pro_apt_news
   ubuntu_pro_esm_cache
   ubuntu_pro_esm_cache//apt_methods
   ubuntu_pro_esm_cache//apt_methods_gpgv
   ubuntu_pro_esm_cache//cloud_id
   ubuntu_pro_esm_cache//dpkg
   ubuntu_pro_esm_cache//ps
   ubuntu_pro_esm_cache//ubuntu_distro_info
   ubuntu_pro_esm_cache_systemctl
   ubuntu_pro_esm_cache_systemd_detect_virt
   virt-aa-helper
26 profiles are in complain mode.
   adbd
   android_app
   avahi-daemon
   dnsmasq
   dnsmasq//libvirt_leaseshelper
   identd
   klogd
   libreoffice-oosplash
   libreoffice-soffice
   lxc-waydroid
   mdnsd
   nmbd
   nscd
   php-fpm
   ping
   samba-bgqd
   smbd
   smbd//null-/usr/lib/x86_64-linux-gnu/samba/samba-bgqd
   smbldap-useradd
   smbldap-useradd///etc/init.d/nscd
   snap.code.code
   snap.code.url-handler
   snap.powershell.powershell
   syslog-ng
   syslogd
   traceroute
0 profiles are in kill mode.
0 profiles are in unconfined mode.
18 processes have profiles defined.
7 processes are in enforce mode.
   /usr/bin/freshclam (2030) 
   /usr/sbin/clamd (1246) 
   /usr/sbin/cups-browsed (2267) 
   /usr/sbin/cupsd (1825) 
   /usr/sbin/libvirtd (1827) libvirtd
   /snap/snapd-desktop-integration/387/usr/bin/user-session-helper (7730) snap.snapd-desktop-integration.snapd-desktop-integration
   /snap/snapd-desktop-integration/387/usr/bin/snapd-desktop-integration (7803) snap.snapd-desktop-integration.snapd-desktop-integration
11 processes are in complain mode.
   /usr/sbin/avahi-daemon (1195) avahi-daemon
   /usr/sbin/avahi-daemon (1244) avahi-daemon
   /usr/sbin/dnsmasq (2027) dnsmasq
   /usr/sbin/dnsmasq (2028) dnsmasq
   /usr/sbin/dnsmasq (2187) dnsmasq
   /usr/sbin/dnsmasq (7611) dnsmasq
   /usr/sbin/nmbd (2041) nmbd
   /usr/sbin/smbd (2694) smbd
   /usr/sbin/smbd (2722) smbd
   /usr/sbin/smbd (2723) smbd
   /usr/lib/x86_64-linux-gnu/samba/samba-bgqd (2740) smbd//null-/usr/lib/x86_64-linux-gnu/samba/samba-bgqd
0 processes are unconfined but have a profile defined.
0 processes are in mixed mode.
0 processes are in kill mode.
```

## Auditd
```
-w /etc/passwd -p wa -k identity
-w /etc/group -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/sudoers -p wa -k sudoers
-w /etc/ssh/sshd_config -p wa -k sshd
-w /var/log/auth.log -p wa -k authlog
-a always,exit -F arch=b64 -S execve -F euid=0 -F key=rootcmd
-w /etc/passwd -p wa -k passwd_changes
-w /etc/shadow -p wa -k shadow_changes
-w /etc/group -p wa -k group_changes
-w /etc/gshadow -p wa -k gshadow_changes
-w /etc/sudoers -p wa -k sudoers_changes
-w /etc/ssh/sshd_config -p wa -k sshd_config_changes
-w /var/log/auth.log -p wa -k authlog_changes
```

## Sysctl principaux
```
kernel.randomize_va_space = 2
kernel.kptr_restrict = 2
net.ipv4.tcp_syncookies = 1
fs.protected_symlinks = 1
```
