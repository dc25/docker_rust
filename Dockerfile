FROM ubuntu:16.04

# Build as user "builder" with arbitrary user id.
ENV USER_NAME builder
ENV USER_ID 54862

# Set the locale - was (and may still be ) necessary for ghcjs-boot to work
# Got this originally here: # http://askubuntu.com/questions/581458/how-to-configure-locales-to-unicode-in-a-docker-ubuntu-14-04-container
#
# 2015-10-25 It seems like ghcjs-boot works without this now but when I 
# removed it, vim starting emitting error messages when using plugins 
# pathogen and vim2hs together.  
#
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

# Create a new user, to do the rest of the build.
RUN apt-get update 
RUN apt-get install -y sudo cpio curl daemontools entr git net-tools openssh-server python tmux vim-gtk
RUN adduser --disabled-password --gecos '' --uid $USER_ID $USER_NAME
RUN adduser $USER_NAME sudo 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY build_scripts/setup_sshd $WORKAREA
RUN ./setup_sshd 

ENV WORKAREA /home/$USER_NAME/workarea/
RUN mkdir -p $WORKAREA
WORKDIR $WORKAREA
USER $USER_NAME

###
COPY build_scripts/setup_basic_vim_plugins $WORKAREA
RUN ./setup_basic_vim_plugins

## Install a recent version of node.  
COPY build_scripts/install_node $WORKAREA
RUN ./install_node

### Copy entire build scripts directory.
### Last step so that new files don't trigger excessive rebuild.
COPY build_scripts $WORKAREA
RUN sudo cp start.sh /
