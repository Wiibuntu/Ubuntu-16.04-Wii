# Ubuntu16-Wii

## Changing bootargs with baedit
It is possible to change kernel command line arguments (also known as bootargs from the DTS file) with a hex editor, with (very careful) usage of sed, or with the provided baedit tool.

To show current bootargs embedded in the kernel:

$ baedit zImage
>OK: 3201336 bytes read
current  bootargs = 'root=/dev/mmcblk0p2 console=tty0 console=ttyUSB0,115200 force_keyboard_port=4 video=gcnfb:tv=auto loader=mini nobats rootwait       
To change the arguments, just pass them as second parameter to baedit:

$ baedit zImage 'your new arguments here'
>OK: 3201336 bytes read
current  bootargs = 'root=/dev/mmcblk0p2 console=tty0 console=ttyUSB0,115200 force_keyboard_port=4 video=gcnfb:tv=auto loader=mini nobats rootwait       
replaced bootargs = 'your new arguments here                                                                                                                              '
>OK: 3201336 bytes written


## All From https://github.com/neagix/wii-linux-ngx
