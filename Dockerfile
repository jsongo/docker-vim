from debian:jessie 

RUN apt-get update
RUN apt-get install -y git vim ctags xclip python-setuptools vim-nox
RUN easy_install pip && \
    pip install -U autopep8
RUN apt-get -y install vim-gnome
RUN apt-get -y install sudo
RUN ln -s /usr/bin/ctags /usr/local/bin/ctags

RUN useradd -d /home/$USER_NAME $USER_NAME && \
    # usermod -p initpwd $USER_NAME && \
    adduser $USER_NAME sudo

# user name
ENV USER_NAME jsongo
ENV TERM xterm-256color

RUN mkdir -p /home/$USER_NAME && \
    chown $USER_NAME:$USER_NAME /home/$USER_NAME

# additional useful tools
RUN apt-get install -y htop lsof netcat

USER $USER_NAME

WORKDIR /home/$USER_NAME
COPY vim.sh .bashrc /home/$USER_NAME/
# RUN ls -lh /home/${USER_NAME}/vim.sh

EXPOSE 22
CMD ["/home/${USER_NAME}/vim.sh"]
ENTRYPOINT ["sh", "-c"]
