# Ubuntu 16.04 LTS Nintendo Wii


This repository contains images of Ubuntu 16 for the Wii.

# About The Project
One of the final planned releases of Ubuntu for the Wii. With many trial and errors.
This versions actually build somewhat off of [Wii-Linux-NGX](https://github.com/neagix/wii-linux-ngx)
But this version uses the same bootloader with a different kernel, a newer one. And it also boots Ubuntu 16 instead of Debian 8.

Kernel branch used in this is v4.20 from https://github.com/Wii-Linux/wii-linux-ngx which is forked from the original [NGX repo](https://github.com/neagix/wii-linux-ngx).

# OPTIONAL v5.4.293 KERNEL
Ubuntu 16 does not need a kernel this high, but cant hurt from the security patches the kernel provides.
please follow the steps [here](https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/tag/zImage-v5.4.293) to upgrade your current Ubuntu 16 Wii release.
[KERNEL SOURCE HERE](https://github.com/Wii-Linux/wii-linux-ngx/tree/wii-v5.4)

# What You Need

Wii with Homebrew Channel

USB Flash Drive (8gb or more)

SD card (1gb more more for just BootFS)
(32gb or more for AIO Image)

Tool to flash SD card and Flash Drive.


# How to Install (Homebrew Needed!)

You have 3 options. The Lubuntu Desktop Environment Provided is currently WORKING!
But the server version is out of date and doesnt support the new kernel or BootFS yet.

Lubuntu AIO - [Download Lubuntu 16 AIO](https://www.dropbox.com/scl/fi/uhsqh3k1q8bv01sxukbsc/Ubuntu-16-Wii-AIO-2025-06-04.img?rlkey=9up7k2o5jaavnc7h95zf546tf&st=yk48v0t2&dl=0)

Lubuntu USB - [Download Lubuntu 16 USB](https://www.dropbox.com/scl/fi/g7iiv6yeojq023ym2sosc/Wiibuntu-16.04-USBFS-2025-05-04-1547.img?rlkey=brlpe7u5to7p7w4ro3yt1wlzy&st=n94r84dx&dl=0)

AIO Server - [Download Ubuntu 16 Server](https://www.dropbox.com/scl/fi/iojn7l04xr8s5xftx5qe5/Ubuntu-16-SERVER-Wii-AIO-2025-06-04.img?rlkey=c88cavei4xu1nujgyqywfkhjn&st=h43gcaa2&dl=0)

USB Server - [Download Ubuntu 16 Server](https://www.dropbox.com/scl/fi/o1sgnqhkznm7zg3qqqzh4/Wiibuntu-16-Server-USB-2025-05-10-1804.img?rlkey=4ja9k994sloy3hua29h2jr226&st=rzmbwhcf&dl=0)

Now you will need to download the boot partition. This is what will be flashed to an SD card and how you will boot gumboot and the Kernel.

[Download Boot Partition](https://www.dropbox.com/scl/fi/aj4kh6mfuj9vi9dpypgz6/Wiibuntu-BOOTFS-v5.2-2025-06-04.img?rlkey=fngcarz4jq3ezkb8krbmnl0e4&st=r3ej79j5&dl=0)

The final step will be to flash the .img files to the devices. Boot partition to the SD card and the RootFS of your choosing to a USB flash drive.

# How To Upgrade Without Re-Flashing

Note: This is only for upgrading to a new version of the Ubuntu 16 release, not for updating from 14-16. Although very possible its not been tested.

Please run the new script in this repository on your Ubuntu Wii system. Or do it manually with the files below.

Download the kernel files/modules [here](https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/tag/zImage-060725)

# How To Boot
You will load up the homebrew channel to see its empty, thats normal. Simply press the home button and click "Launch BootMii"
That will instead load a bootloader known as Gumboot. More on Gumboot [here](https://neagix.github.io/gumboot/).
In order to select a different item in gumboot you MUST have a gamecube controller plugged in. But, thankfully it will auto boot in 30 seconds.

![alt text](https://github.com/Wiibuntu/Ubuntu14-Wii/blob/main/Screenshots/Screen%20Shot%202023-10-17%20at%205.50.29%20PM.png) ![alt text](https://github.com/Wiibuntu/Ubuntu14-Wii/blob/main/Screenshots/Screen%20Shot%202023-10-17%20at%205.50.53%20PM.png) 

Gumboots Options are a little different then shown (Image is for Ubuntu 14) But it will still boot to the Stable kernel by itself after 30 seconds.

You will see 3 Kernel Options, All boot v4.20 but boot from diferent locations. USB is booted by default.

# Login

user- ubuntu

pass- ubuntu

# Wi-Fi Config

TO-DO

Need to create new script for wifi but hardware is detected.

# Known Issues and Fixes

-Fixed Wifi/Ethernet

-Fixed Framebuffer Issues

# Contact
Contact me at wiibuntuhelp@gmail.com I will always try to help if I can and have the time to do so.

