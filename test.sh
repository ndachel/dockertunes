#!/usr/bin/env bash
docker run -d --net=host -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       x11ubuntu xclock

