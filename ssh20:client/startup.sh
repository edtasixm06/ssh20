#! /bin/bash

useradd unix01
useradd unix02
useradd unix03
echo -e "unix01\nunix01\n" | passwd --stdin unix01
echo -e "unix02\nunix02\n" | passwd --stdin unix02
echo -e "unix03\nunix03\n" | passwd --stdin unix03

cp /opt/docker/ldap.conf /etc/openldap/ldap.con
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/system-auth /etc/pam.d/system-auth
cp /opt/docker/system-auth /etc/pam.d/password-auth
cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
mkdir /root/.ssh
cp /opt/docker/known_hosts /root/.ssh/known_hosts

/sbin/nscd
/sbin/nslcd

/usr/bin/ssh-keygen -A
/sbin/sshd -D

#/bin/bash

