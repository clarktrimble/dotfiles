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

RUN curl -O https://thoughtbot.github.io/rcm/debs/rcm_1.2.3-1_all.deb
RUN dpkg -i rcm_1.2.3-1_all.deb
RUN mv .dotfiles/ dotfiles
RUN env RCRC=$HOME/dotfiles/rcrc rcup -f
RUN git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
RUN vim -u $HOME/.vimrc.bundles +PluginInstall +PluginClean! +qa

#RUN cd .dotfiles && make golang dev

CMD ["tmux"]

## think about docker volume for dotfiles dir ???
