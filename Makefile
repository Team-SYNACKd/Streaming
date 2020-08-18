CC := gcc
CFLAGS := -g -o
ALL_CFLAGS := -I. $(CFLAGS)


LIBS := -lstdc++ -lavcodec -lavformat -lavutil -lswresample -lswscale -lglfw -lGL
TARGET_DIR := bin/

SRC_PLAYER := main_window.cpp decoder.cpp
SRC_TCP_PLAYER := tcp_main_window.cpp decoder.cpp tcp_client.c
SRC_TCP_SERVER := tcp_server.c
SRC_TRANSCODER := transcoder.c debug.c

.PHONY: all

all: dir player tcp_player tcp_server transcoder

dir:
	if [ ! -d "$(TARGET_DIR)" ]; then \
		mkdir -p $(TARGET_DIR); \
	fi

player: dir
	$(CC) $(SRC_PLAYER) $(LIBS) $(ALL_CFLAGS) $(TARGET_DIR)$@

tcp_server: dir
	$(CC) $(SRC_TCP_SERVER) $(CFLAGS) $(TARGET_DIR)$@

tcp_player: dir
	$(CC) $(SRC_TCP_PLAYER) $(LIBS) $(ALL_CFLAGS) $(TARGET_DIR)$@

transcoder: dir
	$(CC) $(SRC_TRANSCODER) $(LIBS) $(ALL_CFLAGS) $(TARGET_DIR)$@