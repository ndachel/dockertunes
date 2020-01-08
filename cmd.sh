#!/usr/bin/env bash
docker run -it --net=host -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /root/.Xauthority:/home/user/.Xauthority \
       x11ubuntu xclock

