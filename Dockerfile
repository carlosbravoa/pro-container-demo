# Download base image ubuntu 22.04
FROM public.ecr.aws/lts/ubuntu:22.04_stable

# LABEL about the custom image
LABEL maintainer="carlos.bravo@canonical.com"
LABEL version="0.1"
LABEL description="This is demo Pro Docker Image for a PHP container running on Ubuntu 22.04 with a Pro subscription. Do not use on production"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update and install pro client
RUN  apt-get update \ 
     && apt-get install --no-install-recommends -y \ 
     ubuntu-advantage-tools ca-certificates

# If the build process is running on EC2 with Ubuntu Pro, and the service
# metadata allows one jump, the license will be automatically added to the
# container without needing tokens or any other manual step
#RUN pro autoattach

# upgrade packages
RUN apt-get upgrade -y

# Manually installing apache2 and php modules typically used in a web site (e.g. Wordpress)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 \
                 php php-bcmath php-curl libapache2-mod-php \
                 php-imagick php-intl php-json php-mbstring php-mysql php-xml \
                 php-zip ghostscript

# Remove the Pro client and clean repos
RUN apt-get purge --auto-remove -y ubuntu-advantage-tools && \
rm -rf /var/lib/apt/lists/*

# Removing index and copying index.php from our local files
RUN rm /var/www/html/index.html
COPY ./index.php /var/www/html/
EXPOSE 80

# Starting apache manually for the demo
CMD /usr/sbin/apache2ctl -D FOREGROUND

