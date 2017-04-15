FROM nginx:lastest

COPY resources.tar /resources.tar
RUN tar -zxf /resources.tar -C /usr/share/nginx/html/
RUN rm /resources.tar

EXPOSE 80
