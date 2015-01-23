FROM debian:jessie

WORKDIR /root
#ENV TERM xterm-256color

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    vim \
    git \
    man-db \
    tree \
    ssh \
    htop \
    build-essential \
    tmux

COPY . /root/.dotfiles
RUN $HOME/.dotfiles/setup-go.sh
RUN $HOME/.dotfiles/setup-vim.sh

CMD ["bash"]


