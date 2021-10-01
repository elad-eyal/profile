FROM centos:8
RUN dnf groupinstall -y "Development Tools" && \
    dnf install -y ncurses-devel
RUN curl -L http://greenwoodsoftware.com/less/less-590.tar.gz -o src.tgz
RUN tar xzf src.tgz
RUN cd less* && sh configure && make

