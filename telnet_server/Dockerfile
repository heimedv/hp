FROM ubuntu:latest
MAINTAINER heimedv


#Package install 
RUN apt update 
RUN apt install -y ruby

#Expose port
#EXPOSE 23

# add telnet simulator
ADD ./code /code
WORKDIR /code

# run telnet simulator
RUN chmod +x server.rb
CMD ruby server.rb
