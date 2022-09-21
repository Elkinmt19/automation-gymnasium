FROM centos:7

RUN yum install openssh-server -y

RUN useradd -m  remote_elkin_user && \
    echo "remote_elkin_user:elkinmt19" | chpasswd && \
    mkdir /home/remote_elkin_user/.ssh && \
    chmod 700 /home/remote_elkin_user/.ssh

COPY ssh_keys/ssh_key.pub /home/remote_elkin_user/.ssh/authorized_keys

RUN chown remote_elkin_user:remote_elkin_user -R /home/remote_elkin_user/.ssh/ && \
    chmod 600 /home/remote_elkin_user/.ssh/authorized_keys

RUN ssh-keygen -A

RUN yum -y install mysql

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc \
    --create-dirs \
    -o $HOME/minio-binaries/mc

RUN chmod +x $HOME/minio-binaries/mc && \
    echo "export PATH=$PATH:$HOME/minio-binaries/" >> $HOME/.bashrc


RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

CMD /usr/sbin/sshd -D 