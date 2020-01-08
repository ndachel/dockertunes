#!/usr/bin/env bash
docker run -d --rm --name x11ubuntu \
       --net=host \
       -e DISPLAY=$DISPLAY \
       -v $HOME/.wine/user.reg:/home/ndachel/.wine/user.reg:rw \
       -v $HOME/.wine/iTunes:/home/ndachel/iTunes:rw \
       -v $HOME/.wine/appdata:/home/ndachel/.wine/drive_c/users/user/Application\ Data:rw \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /root/.Xauthority:/home/user/.Xauthority \
       --device /dev/snd --group-add audio \
       --cpus "1" \
       itunes:latest \
       wine /home/user/.wine/drive_c/Program\ Files/iTunes/iTunes.exe
