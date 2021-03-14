ARG base=devbase
FROM "$base"

COPY --chown=$USER install_rust.sh /tmp
RUN /tmp/install_rust.sh

COPY --chown=$USER install_rust_helpers.sh /tmp
RUN /tmp/install_rust_helpers.sh

COPY --chown=$USER install_rust-analyzer.sh /tmp
RUN /tmp/install_rust-analyzer.sh

COPY --chown=$USER setup_vscode_debugging.sh /tmp
RUN /tmp/setup_vscode_debugging.sh

COPY --chown=$USER setup_vim_plug.sh /tmp
RUN /tmp/setup_vim_plug.sh

COPY --chown=$USER rustVimrc /tmp
RUN cp /tmp/rustVimrc ~
RUN echo so ~/rustVimrc | tee -a ~/vimrc

COPY --chown=$USER install_vim_plugins.sh /tmp
RUN /tmp/install_vim_plugins.sh

COPY --chown=$USER rustBashrc /tmp
RUN cp /tmp/rustBashrc ~
RUN echo . ~/rustBashrc | tee -a ~/myBashrc > /dev/null 2>&1
