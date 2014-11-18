FROM debian:jessie

WORKDIR /root
ENV TERM xterm-256color

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    vim-nox \
    git \
    ctags \
    procps \
    indent \
    man-db \
    tree \
    openssh-client \
    htop \
    manpages-dev \
    build-essential \
    tmux

COPY . /root/.dotfiles

RUN cd .dotfiles && make golang dev

CMD ["tmux"]
