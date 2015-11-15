/sbin/sysctl -p
echo "none /dev/shm tmpfs defaults,size=2G 0 0" >> /etc/fstab
mount -o remount /dev/shm
