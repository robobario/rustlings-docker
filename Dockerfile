FROM rust:1.39.0-buster
RUN git clone https://github.com/rust-lang/rustlings \
    && cd rustlings \
    && git checkout tags/2.1.0 \
    && cargo install --force --path .
COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]

