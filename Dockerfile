From ubuntu:trusty
MAINTAINER ax2009live@gmail.com

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt-get update \
# Start editing
# Install package here for cache
	&& apt-get -y install supervisor postfix sasl2-bin opendkim opendkim-tools

# Add files
COPY install.sh /opt/install.sh 
COPY main.cf header_checks /etc/postfix/

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf