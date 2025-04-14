FROM node:latest

RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list 
RUN echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list 
RUN apt-get update && apt-get install -y wget dos2unix


WORKDIR /mnt

EXPOSE 9527

CMD chmod -R 777 /mnt/start.sh && dos2unix /mnt/start.sh && /mnt/start.sh && while true; do date; sleep 30s; done 
