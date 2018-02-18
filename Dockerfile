FROM sshd

COPY build_scripts/user_installs.sh .
RUN su ${DEVL} -c ./user_installs.sh

COPY build_scripts/personalize.sh .
RUN su ${DEVL} -c ./personalize.sh

COPY build_scripts/haskellBashrc .
RUN su ${DEVL} -c "echo . ~/haskellBashrc" | tee -a .bashrc

COPY build_scripts/haskellVimrc .
RUN su ${DEVL} -c "echo so ~/haskellVimrc" | tee -a .vimrc

RUN chown -R ${DEVL} .
