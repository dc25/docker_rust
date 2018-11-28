FROM sshd

ARG user
ARG id

RUN apt-get update && apt-get install -y \
    curl 

COPY build_scripts/install_nix.sh /tmp
RUN su ${user} -c /tmp/install_nix.sh

COPY build_scripts/install_vscode.sh /tmp
RUN /tmp/install_vscode.sh

RUN apt-get update && apt-get install -y \
    git \
    vim-gtk 

COPY build_scripts/setup_basic_vim_plugins.sh /tmp
RUN su ${user} -c /tmp/setup_basic_vim_plugins.sh

COPY build_scripts/setup_haskell_vim_plugins.sh /tmp
RUN su ${user} -c /tmp/setup_haskell_vim_plugins.sh

COPY build_scripts/personalize.sh /tmp
RUN su ${user} -c ./personalize.sh

COPY build_scripts/haskellBashrc /tmp
RUN su ${user} -c 'cp /tmp/haskellBashrc ~'
RUN su ${user} -c 'echo . ~/haskellBashrc | tee -a ~/.bashrc'

COPY build_scripts/haskellVimrc /tmp
RUN su ${user} -c 'cp /tmp/haskellVimrc ~'
RUN su ${user} -c "echo so ~/haskellVimrc" | tee -a .vimrc
