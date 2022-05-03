# Free YouTube LIVE streaming with Raspberry PI

## Here you'll find scripts to handle streaming live to Youtube from a Raspberry PI3b+.
I recommend you install the latest 32-bit Raspbian LITE https://www.raspberrypi.com/software/.  
Then install FFmpeg, simply running `apt install ffmpeg` that should be all the pre-reqs you'll need <br>
as (**bash**, **wget**, and **grep** should all be in the base Raspbian system).
<br>

#### Setup
- Next make sure to run raspi-config, and set the camera to LEGACY and reboot your PI - this will give you better control and better CPU utilization (as per Raspbian's documentation "more is offloaded to the GPU").
- This also lets you use the raspivid command which helps you control things precisely (whereas the never v4l-ctl and driver I've found limited - but will surely improve).
- Put the PHP and HTML files out on your website and adjust to suit.
- Create your LIVE stream on Youtube Studio https://studio.youtube.com, and copy the CHANNEL and STREAM_KEY into the bash script
- Once everything is configured, launch your bash script and check your website URL, you should be streaming live! I like to add the file to /etc/rc.local with a line like this: `/path/to/youtube_stream.sh 2>/dev/null & `

Tweak the settings to your heart's desire and if you have something cool to add, pay it forward back here. 
<br>

#### Hosting
I've successfully used Freehostia to host our website and the PHP script found here to keep the URL valid when Youtube decides to switch the videoID each time the service hiccups (super annoying!)
<br>

#### Performance
The RPI runs about 13% on one CPU with this setup (I'm only doing 720p @ 24fps and 250 to conserve bandwidth)

![Raspberry PI running](/assets/rpi_htop.png?raw=true "RPI HTOP output")
<br>

Enjoy, and feel free to improve.  Much of this is hacked together by trial and error - it just works!
