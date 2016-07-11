FROM ubuntu:16.04

# Build as user "builder" with arbitrary user id.
ENV USER_NAME builder
ENV USER_ID 54863

# Set the locale - was (and may still be ) necessary for ghcjs-boot to work
# Got this originally here: # http://askubuntu.com/questions/581458/how-to-configure-locales-to-unicode-in-a-docker-ubuntu-14-04-container
#
# 2015-10-25 It seems like ghcjs-boot works without this now but when I 
# removed it, vim starting emitting error messages when using plugins 
# pathogen and vim2hs together.  
#
# 2016-07-11 Tried taking it out again.
# 2016-07-11 Did not notice problems with vim but saw errors reported that 
#            were not there before when running ./try-reflex . Leaving in.
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get update && apt-get install -y \
    bzip2 \
    cpio \
    curl \
    daemontools \
    entr \
    git \
    net-tools \
    openssh-server \
    python \
    tmux \
    sudo \
    vim-gtk 

# Create a new user, to do the rest of the build.
RUN adduser --disabled-password --gecos '' --uid $USER_ID $USER_NAME
RUN adduser $USER_NAME sudo 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY build_scripts/setup_sshd $WORKAREA
RUN ./setup_sshd 

USER $USER_NAME
ENV WORKAREA /home/$USER_NAME/workarea/
RUN mkdir -p $WORKAREA
WORKDIR $WORKAREA

###
COPY build_scripts/setup_basic_vim_plugins $WORKAREA
RUN ./setup_basic_vim_plugins

COPY build_scripts/setup_vim_plugins_for_haskell $WORKAREA
RUN ./setup_vim_plugins_for_haskell

### Copy entire build scripts directory.
### Last step so that new files don't trigger excessive rebuild.
COPY build_scripts $WORKAREA
RUN sudo cp start.sh /
