FROM ubuntu:wily

# Build as user "builder" with arbitrary user id.
ENV USER_NAME builder
ENV USER_ID 54853

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
RUN apt-get install -y sudo
RUN adduser --disabled-password --gecos '' --uid $USER_ID $USER_NAME
RUN adduser $USER_NAME sudo 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER $USER_NAME

ENV WORKAREA /home/$USER_NAME/workarea/
RUN mkdir -p $WORKAREA
WORKDIR $WORKAREA

COPY build_scripts/install_apts $WORKAREA
RUN ./install_apts cpio curl daemontools entr git net-tools openssh-server python tmux vim-gtk

COPY build_scripts/setup_basic_vim_plugins $WORKAREA
RUN ./setup_basic_vim_plugins

RUN ./install_apts npm libsqlite3-dev ruby ruby-dev

COPY build_scripts/install_gems $WORKAREA
RUN ./install_gems sass haml

COPY build_scripts/setup_sshd $WORKAREA
RUN ./setup_sshd 

COPY build_scripts $WORKAREA
RUN sudo cp start.sh /
