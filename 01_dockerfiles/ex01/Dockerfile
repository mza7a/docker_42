FROM debian

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

WORKDIR /root/

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget bzip2 -y
RUN wget https://files.teamspeak-services.com/releases/server/3.9.1/teamspeak3-server_linux_amd64-3.9.1.tar.bz2
RUN tar -xvf teamspeak3-server_linux_amd64-3.9.1.tar.bz2
RUN rm teamspeak3-server_linux_amd64-3.9.1.tar.bz2

WORKDIR teamspeak3-server_linux_amd64/

RUN touch .ts3server_license_accepted
RUN echo "license_accepted=1" > .ts3server_license_accepted

ENTRYPOINT sh ts3server_minimal_runscript.sh
