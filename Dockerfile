FROM devbase

COPY install_rust.sh /tmp
RUN /tmp/install_rust.sh

COPY install_rls.sh /tmp
RUN /tmp/install_rls.sh

COPY install_rust_helpers.sh /tmp
RUN /tmp/install_rust_helpers.sh

COPY setup_vim_plug.sh /tmp
RUN /tmp/setup_vim_plug.sh

COPY rustVimrc /tmp
RUN cp /tmp/rustVimrc ~
RUN echo so ~/rustVimrc | tee -a ~/vimrc

COPY install_vim_plugins.sh /tmp
RUN /tmp/install_vim_plugins.sh

COPY setup_vscode_debugging.sh /tmp
RUN /tmp/setup_vscode_debugging.sh

COPY myBashrc /tmp
RUN cp /tmp/myBashrc ~
RUN echo . ~/myBashrc | tee -a ~/.bashrc
