# Ubuntu 16.04 LTS Nintendo Wii


This repository contains images of Ubuntu 16 for the Wii.

# About The Project
One of the final planned releases of Ubuntu for the Wii. With many trial and errors.
This versions actually build somewhat off of [Wii-Linux-NGX](https://github.com/neagix/wii-linux-ngx)
But this version uses the same bootloader with a different kernel, a newer one. And it also boots Ubuntu 16 instead of Debian 8.

Kernel branches used in this is v4.4, v4.5, and v4.9 from https://github.com/Wii-Linux/wii-linux-ngx which is forked from the original [NGX repo](https://github.com/neagix/wii-linux-ngx).

# What You Need

Wii with Homebrew Channel

USB Flash Drive (16gb or more for Lubuntu, 8gb or more for Server Image)

SD card (1gb more more)

Tool to flash SD card and Flash Drive.


# How to Install (Homebrew Needed!)

You have 2 options. The Lubuntu Desktop Environment Provided is currently broken due to a framebuffer issue, Still boots and works but runs VERY slow and colors are not correct.
But the server version without a desktop Environment runs fine. The desktop Environment will be improved upon as this is still in development. (This only applies to the "stable" kernel)

Experimental - [Download Lubuntu 16](https://github.com/Wiibuntu/Ubuntu16-Wii/releases/tag/Lubuntu.e2)

Stable - [Download Ubuntu 16 Server](https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/download/Ubuntu-Server.t2/Ubuntu.16.Server.v2.2024-11-09.0952.img.gz.001)

Now you will need to download the boot partition. This is what will be flashed to an SD card and how you will boot gumboot and the Kernel.

[Download Boot Partition](https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/download/Lubuntu.e2/Ubuntu.16.Boot.v3.img)

The final step will be to flash the .img files to the devices. Boot partition to the SD card and the RootFS of your choosing to a USB flash drive.

# How To Upgrade Without Re-Flashing

Note: This is only for upgrading to a new version of the Ubuntu 16 release, not for updating from 14-16. Although very possible its not been tested.

No matter what you will have to reflash the SD card or at least copy the kernels from the .img file and gumboot.lst to your current SD card.

Download the 3 kernel modules [here](https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/tag/modules.v1) or just the one for the kernel you know you are going to use, I say put all 3 just so you can play around if you want.

Extract them and mount the flash drive with your current Wii Linux Filesystem and copy the folders inside the archives to /lib/modules

then unmount and make sure you flashed the SD card with the new kernels and you should be good to go.

# How To Boot
You will load up the homebrew channel to see its empty, thats normal. Simply press the home button and click "Launch BootMii"
That will instead load a bootloader known as Gumboot. More on Gumboot [here](https://neagix.github.io/gumboot/).
In order to select a different item in gumboot you MUST have a gamecube controller plugged in. But, thankfully it will auto boot in 30 seconds.

![alt text](https://github.com/Wiibuntu/Ubuntu14-Wii/blob/main/Screenshots/Screen%20Shot%202023-10-17%20at%205.50.29%20PM.png) ![alt text](https://github.com/Wiibuntu/Ubuntu14-Wii/blob/main/Screenshots/Screen%20Shot%202023-10-17%20at%205.50.53%20PM.png) 

Gumboots Options are a little different then shown (Image is for Ubuntu 14) But it will still boot to the Stable kernel by itself after 30 seconds.

You will see 3 Kernels, by default it boots the stable v4.4 kernel, under that is unstable v4.5 and under that is testing v4.9.

# Login

user- ubuntu

pass- ubuntu

# Wi-Fi Config

TO-DO

Need to compile and get the open-b43 driver working. Will either provide a new rootfs for you to flash in the future AND/OR will add another work around.

# Known Issues and Fixes

- No Wifi Support

- No DVD Support

- Framebuffer support depends on the release you are using

# Contact
Contact me at wiibuntuhelp@gmail.com I will always try to help if I can and have the time to do so.

