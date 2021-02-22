FROM centos
COPY lab1.sh /home
RUN chmod ugo+x home/lab1.sh
CMD ./home/lab1.sh