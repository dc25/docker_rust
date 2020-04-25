FROM devbase

COPY build_scripts/install_rust.sh /tmp
RUN /tmp/install_rust.sh

COPY build_scripts/install_rls.sh /tmp
RUN /tmp/install_rls.sh

COPY build_scripts/install_rust_helpers.sh /tmp
RUN /tmp/install_rust_helpers.sh

COPY build_scripts/setup_vim_plug.sh /tmp
RUN /tmp/setup_vim_plug.sh

COPY build_scripts/rustVimrc /tmp
RUN cp /tmp/rustVimrc ~
RUN echo so ~/rustVimrc | tee -a ~/vimrc

COPY build_scripts/install_vim_plugins.sh /tmp
RUN /tmp/install_vim_plugins.sh

COPY build_scripts/setup_vscode_debugging.sh /tmp
RUN /tmp/setup_vscode_debugging.sh

COPY build_scripts/myBashrc /tmp
RUN cp /tmp/myBashrc ~
RUN echo . ~/myBashrc | tee -a ~/.bashrc
