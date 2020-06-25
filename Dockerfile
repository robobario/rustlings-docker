FROM rust:1.44.1 as builder
WORKDIR /usr/src
RUN rustup target add x86_64-unknown-linux-musl

RUN git clone https://github.com/rust-lang/rustlings \
    && cd rustlings \
    && git checkout tags/3.0.0 \
    && cargo install --target x86_64-unknown-linux-musl --path .

FROM rust:1.44.1-alpine
COPY --from=builder /usr/src/rustlings /rustlings
COPY --from=builder /usr/local/cargo/bin/rustlings /bin/
COPY --from=builder /usr/local/cargo/bin/rustc /bin/
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 && \
echo "057ecd4ac1d3c3be31f82fc0848bf77b1326a975b4f8423fe31607205a0fe945  /usr/local/bin/dumb-init" | sha256sum -c - && \
chmod 755 /usr/local/bin/dumb-init && chmod 755 /usr/bin/entrypoint.sh
WORKDIR /opt/rustlings
ENTRYPOINT ["/usr/local/bin/dumb-init", "/usr/bin/entrypoint.sh"]
