FROM drydockaarch64/u16:master

ADD . /u16cpp

RUN /u16cpp/install.sh
