FROM haproxy


COPY ./haproxy/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
#RUN dos2unix /usr/local/etc/haproxy/haproxy.cfg

#RUN chmod -R 777 /usr/local/etc/haproxy/haproxy.cfg
#RUN sed -i -E "s/\r//" /usr/local/etc/haproxy/haproxy.cfg

EXPOSE 5670
EXPOSE 35672
EXPOSE 35674
EXPOSE 9999

#CMD tail -f  /usr/local/etc/haproxy/haproxy.cfg