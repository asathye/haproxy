#
# Haproxy Dockerfile
#
# https://github.com/dockerfile/haproxy
#

# Pull base image.
FROM dockerhub.ccg21.dev.paypalcorp.com/paas/ppsb-extra

# Install Haproxy.
RUN  rpm -ivh http://yumrepolvs01.qa.paypal.com/5.9/nonprod/extras/haproxy-1.5.12-0.pp.el5.x86_64.rpm
# Add files.
ADD start.bash /haproxy-start

# Define mountable directories.
VOLUME ["/haproxy-override"]

# Define working directory.
WORKDIR /

# Define default command.
CMD ["bash", "/haproxy-start"]

