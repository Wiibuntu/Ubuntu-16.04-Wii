# Ubuntu 16.04 LTS Nintendo Wii


This repository contains images of Ubuntu 16 for the Wii.

# THIS IS CURRENTLY EXPERIMENTAL! THINGS ARE BROKEN! FOR A STABLE EXPERIENCE USE [UBUNTU 14](https://github.com/Wiibuntu/Ubuntu14-Wii)

# About The Project
One of the final planned releases of Ubuntu for the Wii. With many trial and errors.
This versions actually build somewhat off of [Wii-Linux-NGX](https://github.com/neagix/wii-linux-ngx)
But this version uses the same bootloader with a different kernel, a newer one. And it also boots Ubuntu 16 instead of Debian 8.

Kernel branch used is Version 4.4 from https://github.com/Wii-Linux/wii-linux-ngx which is forked from the original [NGX repo](https://github.com/neagix/wii-linux-ngx).

# What You Need

Wii with Homebrew Channel

USB Flash Drive (8gb or more for Lubuntu) (4gb or more for Others)

SD card (1gb more more)

Tool to flash SD card and Flash Drive.


# How to Install (Homebrew Needed!)

You have 2 options. The Lubuntu Desktop Environment Provided is currently broken due to a framebuffer issue, Still boots and works but runs VERY slow and colors are not correct.
But the server version without a desktop Environment runs fine. The desktop Environment will be improved upon as this is still in development. (This only applies to the "stable" kernel)

Experimental - [Download Lubuntu 16](https://github.com/Wiibuntu/Ubuntu16-Wii/releases/tag/Lubuntu.e1)

Testing - [Download Ubuntu 16 Server](https://github.com/Wiibuntu/Ubuntu16-Wii/releases/download/Ubuntu-Server.t1/Ubuntu.Server.16.Wii.img.gz)

Now you will need to download the boot partition. This is what will be flashed to an SD card and how you will boot gumboot and the Kernel.

[Download Boot Partition](https://github.com/Wiibuntu/Ubuntu16-Wii/releases/download/boot.v1/Ubuntu.16.Boot.v2.img)

The final step will be to flash the .img files to the devices. Boot partition to the SD card and the RootFS of your choosing to a USB flash drive.

# How To Boot
You will load up the homebrew channel to see its empty, thats normal. Simply press the home button and click "Launch BootMii"
That will instead load a bootloader known as Gumboot. More on Gumboot [here](https://neagix.github.io/gumboot/).
In order to select a different item in gumboot you MUST have a gamecube controller plugged in. But, thankfully it will auto boot in 30 seconds.

![alt text](https://github.com/Wiibuntu/Ubuntu14-Wii/blob/main/Screenshots/Screen%20Shot%202023-10-17%20at%205.50.29%20PM.png) ![alt text](https://github.com/Wiibuntu/Ubuntu14-Wii/blob/main/Screenshots/Screen%20Shot%202023-10-17%20at%205.50.53%20PM.png) 

Gumboots Options are a little different then shown (Image is for Ubuntu 14) But it will still boot to the Stable kernel by itself after 30 seconds.

You will see 2 Kernel 4's and one labeled broken. THEY ARE THE SAME! One was compiled with Devkitpro PPC Compiler and the other with the standard PPC GCC compiler (Broken).

# Login

user- ubuntu

pass- ubuntu

# Wi-Fi Config

TO-DO

Need to compile and get the open-b43 driver working. Will either provide a new rootfs for you to flash in the future AND/OR will add another work around.

# Known Issues and Fixes

- Default/Working Kernel has a framebuffer problem and the colors dont work properly. (Compiled With DevkitPPC GCC)

- Broken Kernel has accurate colors but no USB devices aside from the boot device seem to work. Only possible use would be SSH if/when WiFi is added.

# Contact
Contact me at wiibuntuhelp@gmail.com I will always try to help if I can and have the time to do so.

