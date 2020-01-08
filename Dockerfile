FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get install -y x11-apps xauth wget gnupg software-properties-common 
RUN dpkg --add-architecture i386
RUN apt-get -y update

RUN wget -qO- https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository 'deb http://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN apt-get install -y --install-recommends winehq-stable

RUN apt-get install -y file winetricks p7zip
ENV WINEARCH win64

RUN mkdir -p /home/ndachel/.wine
RUN mkdir -p /extracted
RUN cd /extracted
RUN wget -q -O /extracted/itunes-installer.exe \
 https://secure-appldnld.apple.com/itunes12/091-81691-20180709-C98EBAE5-D5C5-41EC-9847-A5F71D9C4437/iTunesSetup.exe

RUN winetricks -q gdiplus
RUN winetricks -q msls31
RUN winetricks -q msxml3
#RUN dpkg --add-architecture i386 && apt-get update && apt-get install wine32
#RUN cd /extracted/
#RUN 7za e itunes-installer.exe
#RUN msiexec /i AppleSoftwareUpdate.msi /qn
#RUN msiexec /i AppleApplicationSupport.msi  /qn
#RUN msiexec /i Bonjour.msi /qn
#RUN msiexec /i iTunes.msi /qn
#RUN rm -rf ~/.cache /extracted/*
