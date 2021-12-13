import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;



  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.network(
      'https://youtu.be/vtg2CcUoJ1o',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: SizedBox(
        width: size.width,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
