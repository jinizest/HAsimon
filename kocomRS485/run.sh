#!/bin/sh

SHARE_DIR=/share/kocom

#  파일 삭제
if [ -f "$SHARE_DIR/rs485.py" ]; then
    rm -f "$SHARE_DIR/rs485.py"  # 강제 삭제(-f)
fi

# 디렉토리 생성 보장 (안전한 생성)
mkdir -p "$SHARE_DIR"  # -p: 이미 존재해도 오류 안 남

# 파일 이동 (새 버전으로 교체)
if [ ! -f "$SHARE_DIR/rs485.py" ]; then
    mv /rs485.py "$SHARE_DIR"
fi

/makeconf.sh

echo "[Info] Run Wallpad Controller"
cd $SHARE_DIR
python3 $SHARE_DIR/rs485.py

# for dev
while true; do echo "still live"; sleep 100; done
