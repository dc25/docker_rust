FROM sshd

ARG user
ARG id

COPY build_scripts/install_nix.sh /tmp
RUN su ${user} -c /tmp/install_nix.sh

COPY build_scripts/install_miso.sh /tmp
RUN su ${user} -c /tmp/install_miso.sh

COPY build_scripts/user_installs.sh /tmp
RUN su ${user} -c ./user_installs.sh

COPY build_scripts/personalize.sh /tmp
RUN su ${user} -c ./personalize.sh

COPY build_scripts/haskellBashrc /tmp
RUN su ${user} -c 'cp /tmp/haskellBashrc ~'
RUN su ${user} -c 'echo . ~/haskellBashrc | tee -a ~/.bashrc'

COPY build_scripts/haskellVimrc /tmp
RUN su ${user} -c 'cp /tmp/haskellVimrc ~'
RUN su ${user} -c "echo so ~/haskellVimrc" | tee -a .vimrc
