#check the current root volume usage  (43%)
df -h
#download image/create a container & check the current root volume usage (46%)
docker run --rm --name frontend -p 8000:80 nginx
df -h
#if you keep on downloading images/creating containers the root volume reaches to 100%

#Steps To Create EBS Volume and Attaching it to the instance

1. #Create volume (xvdf) & attach to our server instance in GUI
2. #Validate the volume in linux
    lsblk  # (xvdf -- disk)
3. #Format the newly created volume(xvdf)
    fdisk /dev/xvdf   #n > p > w
4. #Validate the formated volume
    lsblk  # (xvdf1 -- part)
5. #create file system for newly created volume
    mkfs.ext4 /dev/xvdf1  # it will generate file system UUID=0126c94e-e703-40bf-89de-692e2606d48a  /dockerdata ext4
6. #Create directory
    mkdir /dockerdata
7. #Add UUID code generated in 5th step & directory info into below path
    nano /etc/fstab
    UUID=0126c94e-e703-40bf-89de-692e2606d48a  /dockerdata ext4    #(paste this entire details)
8. #mount this volume
     mount -a
9. #validate the newly created volume is available/not
     df -h
# Once EBS Volume created,fdisk and mount it -- we need to follow the below commands

sudo systemctl stop docker.service
  
sudo systemctl stop docker.socket
  
sudo nano /lib/systemd/system/docker.service Add the following line with the custom directo
  
#ExecStart=/usr/bin/dockerd -H fd:// -- containerd=/run/containerd/containerd.sock
  
ExecStart=/usr/bin/dockerd --data-root /dockerdata -H fd:// -- containerd=/run/containerd/containerd. sock

sudo rsync -aqxP /var/lib/docker/ /dockerdata
  
sudo systemctl daemon-reload && sudo systemctl start docker
  
sudo systemctl status docker --no-pager
  
ps aux | grep -i docker | grep -v grep





