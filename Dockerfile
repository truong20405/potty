# Dockerfile
FROM ubuntu:20.04

# Cài đặt các phần mềm cần thiết
RUN apt-get -y update && \
    apt-get install -y curl wget python3 python3-pip locales vim nano htop tmux && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get purge --auto-remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*

# Copy script khởi động GOTTY
COPY /run_gotty.sh /run_gotty.sh

# Cấp quyền cho script
RUN chmod 744 /run_gotty.sh

# Mở cổng để GOTTY có thể kết nối
EXPOSE 8080

# Chạy script khi container khởi động
CMD ["/bin/bash","/run_gotty.sh"]
