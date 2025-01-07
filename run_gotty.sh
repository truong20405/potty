#!/bin/bash

# Kiểm tra xem screen session đã tồn tại chưa
screen -list | grep -q "mysession"

# Nếu session chưa tồn tại, tạo mới và chạy GOTTY trong session đó
if [ $? != 0 ]; then
    # Tạo session mới và chạy GOTTY để chia sẻ terminal
    screen -dmS mysession /usr/local/bin/gotty --permit-write --reconnect -p 8080 /bin/bash
fi

# Giữ container chạy mà không thoát
tail -f /dev/null
