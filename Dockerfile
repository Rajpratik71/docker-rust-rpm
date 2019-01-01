FROM fedora

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN dnf install -y @development-tools rpm-build; \
    curl https://sh.rustup.rs -sSf | bash -s - -y; \
    rustup component add rustfmt; \
    rustup target add x86_64-unknown-linux-musl;
