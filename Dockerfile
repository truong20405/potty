FROM ubuntu:20.04
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y curl wget python3 python3-pip locales vim nano htop screen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cài đặt GOTTY
ENV GOTTY_TAG_VER v1.0.1
RUN curl -sLk https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/gotty_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin

# Copy script khởi động GOTTY
COPY /run_gotty.sh /run_gotty.sh
RUN chmod 744 /run_gotty.sh

# Mở cổng cho GOTTY
EXPOSE 8080

# Chạy GOTTY khi container bắt đầu
CMD ["/bin/bash", "/run_gotty.sh"]
