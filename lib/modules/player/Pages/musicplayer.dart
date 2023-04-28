import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:musicappnew/modules/player/Widgets/playerbox.dart';

import '../../songs/Model/SongModel.dart';

// ignore: must_be_immutable
class MusicPlayer extends StatefulWidget {
  Song song;
  MusicPlayer({super.key, required this.song});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool _isPlaying = false;
  late AudioPlayer audioPlayer;
  Duration? _duration;
  Duration? _position;
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
      appBar: AppBar(
        backgroundColor: CupertinoColors.inactiveGray,
        shadowColor: CupertinoColors.inactiveGray,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: CupertinoColors.inactiveGray,
              height: height * 0.50,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 1),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.song.photo!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.song.name!,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.song.name!),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    children: [
                      Slider(
                        onChanged: (v) {
                          final Position = v * _duration!.inMilliseconds;
                          audioPlayer
                              .seek(Duration(milliseconds: Position.round()));
                        },
                        value: (_position != null &&
                                _duration != null &&
                                _position!.inMilliseconds > 0 &&
                                _position!.inMilliseconds <
                                    _duration!.inMilliseconds)
                            ? _position!.inMilliseconds /
                                _duration!.inMilliseconds
                            : 0.0,
                      ),
                    ],
                  ),
                ),
                Text(
                  _position != null
                      ? '${_positionText ?? ''} / ${_durationText ?? ''}'
                      : _duration != null
                          ? _durationText
                          : '',
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.volume_off,
                      size: 30, color: Colors.white),
                  onPressed: () async {
                    await audioPlayer.setVolume(0.0);
                  },
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 30,
                    color: Colors.white,
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
                  icon: const Icon(Icons.stop, size: 30, color: Colors.white),
                  onPressed: () {
                    stopAudio();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up_rounded,
                      size: 30, color: Colors.white),
                  onPressed: () async {
                    await audioPlayer.setVolume(1.0);
                  },
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Add to PlayList'),
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
