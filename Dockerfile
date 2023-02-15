ARG base=devbase
FROM $base

COPY --chown=$USER install_rust.sh /tmp
RUN /tmp/install_rust.sh

COPY --chown=$USER install_rust_helpers.sh /tmp
RUN /tmp/install_rust_helpers.sh

COPY --chown=$USER install_mold.sh /tmp
RUN /tmp/install_mold.sh

COPY --chown=$USER install_rust_gtk_dev.sh /tmp
RUN /tmp/install_rust_gtk_dev.sh

COPY --chown=$USER install_rust-analyzer.sh /tmp
RUN /tmp/install_rust-analyzer.sh

COPY --chown=$USER install_latest_node.sh /tmp
RUN /tmp/install_latest_node.sh

COPY --chown=$USER setup_vscode_debugging.sh /tmp
RUN /tmp/setup_vscode_debugging.sh

COPY --chown=$USER install_lunarvim.sh /tmp
## RUN /tmp/install_lunarvim.sh

COPY --chown=$USER setup_home.sh /tmp
RUN /tmp/setup_home.sh
