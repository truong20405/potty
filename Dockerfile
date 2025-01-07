FROM ubuntu:20.04

# Cài đặt GOTTY và các phụ thuộc khác
RUN apt-get update && \
    apt-get install -y curl wget python3 python3-pip locales vim nano htop && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    curl -sLk https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*

# Sao chép script khởi động GOTTY vào container
COPY run_gotty.sh /run_gotty.sh

# Thực thi quyền cho script
RUN chmod +x /run_gotty.sh

# Mở cổng 8080 cho GOTTY
EXPOSE 8080

# Lệnh khởi động container
CMD ["/bin/bash", "/run_gotty.sh"]
