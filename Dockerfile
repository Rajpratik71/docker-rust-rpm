FROM fedora

ARG MUSL_PKG=musl-latest

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:/usr/local/musl/bin:$PATH

RUN dnf install -y @development-tools clang rpm-build; \
    curl https://www.musl-libc.org/releases/$MUSL_PKG.tar.gz -sSf | tar xz; \
    cd $MUSL_PKG; ./configure --disable-shared && make install; cd ..; rm -rf $MUSL_PKG; \
    curl https://sh.rustup.rs -sSf | bash -s - --profile minimal --component rustfmt --target x86_64-unknown-linux-musl -y; \
