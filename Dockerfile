from debian:jessie 

RUN apt-get update
RUN apt-get install -y git vim ctags xclip python-setuptools vim-nox
RUN easy_install pip && \
    pip install -U autopep8
RUN apt-get -y install vim-gnome
RUN apt-get -y install sudo
RUN ln -s /usr/bin/ctags /usr/local/bin/ctags

# user name
ENV USER_NAME jsongo
ENV TERM xterm-256color

RUN useradd -d /home/$USER_NAME $USER_NAME && \
    usermod -p initpwd $USER_NAME && \
    adduser $USER_NAME sudo

RUN mkdir -p /home/$USER_NAME && \
    chown $USER_NAME:$USER_NAME /home/$USER_NAME

USER $USER_NAME

WORKDIR /home/$USER_NAME
COPY vim.sh /home/$USER_NAME
# RUN ls -lh /home/${USER_NAME}/vim.sh

# additional useful tools
RUN apt-get -y install htop lsof netcat

EXPOSE 22
CMD ["/home/${USER_NAME}/vim.sh"]
ENTRYPOINT ["sh", "-c"]
