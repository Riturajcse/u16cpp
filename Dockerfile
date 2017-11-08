FROM drydockaarch64/u16:{{%TAG%}}

ADD . /u16cpp

RUN /u16cpp/install.sh
