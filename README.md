## <u>Progressive Streaming</u>
A simple application that allows the transfer of a video file from the server to the client and upon download, has playback.<br>
A transcoder script has also been introduced which allows the user to encode the given video to a different format.

### Important Libraries Used
+ OpenGL
  + GLFW
+ ffmpeg
  + libavcodec
  + libavformat
  + libswscale

### To run the script
Make sure you have a directory named bin in your project home to run the following commands.<br>

For simply playing the video file:
```
$ cc main_window.cpp decoder.cpp -lstdc++ -lavcodec -lavformat -lavutil -lswresample -lswscale -lglfw -lGL -o bin/player
$ cd bin/
$ ./player <videofilename>
```

For activating TCP server client transfer:
```
$ cc tcp_main_window.cpp decoder.cpp tcp_client.c -lstdc++ -lavcodec -lavformat -lavutil -lswresample -lswscale -lglfw -lGL -o bin/tcp_player && cc tcp_server.c -o bin/tcp_server
$ cd bin/
$ ./tcp_server
$ ./tcp_player <videofilename>
```

For transcoding:
```
$ cc transcoder.c debug.c -lstdc++ -lavcodec -lavformat -lavutil -lswresample -lswscale -lglfw -lGL -o bin/transcoder
$ cd bin/
$ ./transcoder <inputfilename> <desiredoutputfilecodec>
```

### Developed by
[Aniketh Gireesh](https://github.com/Aniketh01)<br>
[Akshay Praveen Nair](https://github.com/iammarco11)
