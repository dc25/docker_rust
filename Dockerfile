FROM sshd

ARG user
ARG id

RUN apt-get update && apt-get install -y \
    curl 

COPY build_scripts/install_nix.sh /tmp
RUN su ${user} -c /tmp/install_nix.sh

COPY build_scripts/install_neovim.sh /tmp
RUN su ${user} -c /tmp/install_neovim.sh

COPY build_scripts/setup_vim_plug.sh /tmp
RUN su ${user} -c /tmp/setup_vim_plug.sh

COPY build_scripts/install_hie_wrapper.sh /tmp
RUN su ${user} -c /tmp/install_hie_wrapper.sh

COPY build_scripts/myVimrc /tmp
RUN su ${user} -c 'cp /tmp/myVimrc ~'
RUN su ${user} -c "echo so ~/myVimrc | tee -a ~/.config/nvim/init.vim"

COPY build_scripts/install_neovim_plugins.sh /tmp
RUN su ${user} -c /tmp/install_neovim_plugins.sh

COPY build_scripts/haskellBashrc /tmp
RUN su ${user} -c 'cp /tmp/haskellBashrc ~'
RUN su ${user} -c 'echo . ~/haskellBashrc | tee -a ~/.bashrc'

