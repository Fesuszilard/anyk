# anyk
ANYK docker image building files




INSTALLATION FROM DOCKERFILE:

password:
you can modify the password in the Dockerfile

building image:

docker build -t ubuntu-gui:20.04 .

create container:

docker run -it -p 5900:5900 --name anyk_app_container ubuntu-gui:20.04

install anyk inside the container:

instal the Tigervnc

start the TigerVNC use: localhost:5900 password: 1234

open terminal:

java -jar /root/Download/abevjava_install.jar






INSTALLATION FROM ANYK UBUNTU IMAGE:

docker pull fesuszilard/anyk-ubuntu:1.0

docker run -it -p 5900:5900 --name anyk_app_container anyk_ubuntu:1.0




USAGE:

docker start anyk_app_container

start the TigerVNC use: localhost:5900 password: 1234
