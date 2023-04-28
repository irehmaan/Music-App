import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:musicappnew/modules/songs/Model/SongModel.dart';

class PlayerBox extends StatefulWidget {
  late Song song;
  PlayerBox({super.key, required this.song});

  @override
  State<PlayerBox> createState() => _PlayerBoxState();
}

class _PlayerBoxState extends State<PlayerBox> {
  bool _isPlaying = false;
  late AudioPlayer audioPlayer;
  late Duration _duration;
  late Duration _position;
  get _durationText => _duration.toString().split('.').first;
  get _positionText => _position.toString().split('.').first;
  @override
  void initState() {
    _initAudioPlayer();
    playAudio(widget.song.preview);

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _initAudioPlayer() {
    audioPlayer = AudioPlayer();

    audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.completed) {
        setState(() {
          _isPlaying = false;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((p) => setState(() {
          _position = p;
        }));
  }

  playAudio(path) async {
    await audioPlayer.play(UrlSource(path));

    setState(() {
      _isPlaying = true;
    });
  }

  pauseAudio() async {
    await audioPlayer.pause();

    setState(() {
      _isPlaying = false;
    });
  }

  stopAudio() async {
    await audioPlayer.stop();

    setState(() {
      _isPlaying = false;
    });
  }

  resumeAudio() async {
    await audioPlayer.resume();

    setState(() {
      _isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.black,
            height: height * 0.60,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //   image: NetworkImage(widget.song.photo),
                      // )
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.volume_off,
                        size: 30,
                      ),
                      onPressed: () async {
                        await audioPlayer.setVolume(0.0);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 30,
                      ),
                      onPressed: () {
                        if (_isPlaying == true) {
                          pauseAudio();
                        } else {
                          resumeAudio();
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.stop,
                        size: 30,
                      ),
                      onPressed: () {
                        stopAudio();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        size: 30,
                      ),
                      onPressed: () async {
                        await audioPlayer.setVolume(1.0);
                      },
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('Add to PlayList'),
                    onPressed: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
