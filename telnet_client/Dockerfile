FROM ubuntu:latest
MAINTAINER heimedv


#Package install 
RUN apt update 
RUN apt install -y ruby

# add telnet simulator
ADD ./code /code
WORKDIR /code

# run telnet simulator
RUN chmod +x client.rb
CMD ruby client.rb
