FROM rust:1.39.0-buster
RUN git clone https://github.com/rust-lang/rustlings \
    && cd rustlings \
    && git checkout tags/2.1.0 \
    && cargo install --force --path .
RUN apt update && apt install -y \
    dumb-init \
    && rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/usr/bin/dumb-init", "bash", "/opt/entrypoint.sh"]
