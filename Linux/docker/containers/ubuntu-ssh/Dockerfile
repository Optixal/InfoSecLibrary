FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y openssh-server
# RUN apt-get install -y lshell
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ENV user=john
RUN useradd -m $user
# Sets user's pass to 12345678
RUN echo "$user:12345678" | chpasswd
RUN echo "$user     hard    nproc       20" >> /etc/security/limits.conf
# COPY ./flag /home/$user/flag
RUN chown -R root:$user /home/$user
RUN chmod -R 750 /home/$user
# RUN chown root:$user /home/$user/flag
# RUN chmod 440 /home/$user/flag

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
