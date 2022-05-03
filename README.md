# Free YouTube LIVE streaming with Raspberry PI

## Here you'll find scripts to handle streaming live to Youtube from a Raspberry PI3b+.
I recommend you install the latest 32-bit Raspbian LITE, and apt install ffmpeg.  That should be all the prereqs you'll need.
Next make sure to run raspi-config, and set the camera to LEGACY and reboot your PI - this will give you better control and 
better CPU utilization as per Raspbians documentation "more is offloaded to the GPU".  This also lets you use the raspivid 
command which helps you control things precisely (whereas the never v4l-ctl and driver I've found limited - but will surely improve).

I've successfully used Freehostia to host our website and the PHP script found here to keep the URL valid when
Youtube decides to switch the videoID each time the service hiccups (super annoying!)

The RPI runs about 13% on one CPU with this setup (I'm only doing 720p to conserve bandwidth)
![Raspberry PI running](/assets/rpi_htop.png?raw=true "RPI HTOP output")

Enjoy, and feel free to improve.  Much of this is hacked together by trial and error - it just works!
