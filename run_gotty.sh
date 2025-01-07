#!/bin/bash

# Kiểm tra xem screen session đã tồn tại chưa
screen -list | grep -q "mysession"

# Nếu session chưa tồn tại, tạo mới
if [ $? != 0 ]; then
    screen -dmS mysession
fi

# Chạy lệnh hoặc chương trình dài hạn (ví dụ: Python script)
screen -r mysession
