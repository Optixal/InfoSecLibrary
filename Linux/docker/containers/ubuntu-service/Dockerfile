FROM ubuntu:latest
ENV user=serviceuser
# RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y xinetd
# RUN apt-get install -y python
RUN useradd -m $user
RUN echo "$user     hard    nproc       20" >> /etc/security/limits.conf
COPY ./program /home/$user/program
# COPY ./flag /home/$user/flag
COPY ./customservice /etc/xinetd.d/customservice
RUN chown -R root:$user /home/$user
RUN chmod -R 750 /home/$user
# RUN chown root:$user /home/$user/flag
# RUN chmod 440 /home/$user/flag
EXPOSE 8000
CMD ["/usr/sbin/xinetd", "-d"]
