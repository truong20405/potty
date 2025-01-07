#!/bin/bash

# Kiểm tra xem tmux session đã tồn tại chưa
tmux has-session -t mysession 2>/dev/null

# Nếu session chưa tồn tại, tạo mới
if [ $? != 0 ]; then
    tmux new-session -d -s mysession
fi

# Kết nối với tmux session
tmux attach -t mysession
