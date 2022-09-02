OUT_DIR=$PWD/../home/by_arch___/$HOSTTYPE,ubuntu
mkdir -p $OUT_DIR
docker run --rm \
           -e https_proxy=$https_proxy \
           -e http_proxy=$http_proxy \
           -e no_proxy=$no_proxy \
           -v $OUT_DIR:/out \
           -u $(id -u):$(id -g) \
           $(docker buildx build -q \
                                 --build-arg HTTP_PROXY=$HTTP_PROXY \
                                 --build-arg HTTPS_PROXY=$HTTPS_PROXY \
                                 --build-arg NO_PROXY=$NO_PROXY \
                                  . ) \
           bash -c "cd /tmp && \
                    git clone https://github.com/tmux/tmux.git && \
                    cd tmux && \
                    sh autogen.sh && \
                    ./configure && \
                    make && \
                    mkdir -p /out/bin /out/bin/man1 && \
                    cp tmux /out/bin/ && \
                    cp tmux.1 /out/bin/man1/"
