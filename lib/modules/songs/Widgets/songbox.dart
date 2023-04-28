// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:musicappnew/modules/player/Pages/musicplayer.dart';

import '../Model/SongModel.dart';

class SongBox extends StatelessWidget {
  Song song;
  SongBox(this.song, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MusicPlayer(
                  song: song,
                )));
      },
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => MusicPlayer(
                    song: song,
                  )));
        },
        child: Card(
          color: Colors.black,
          shadowColor: Colors.black87,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListTile(
              textColor: Colors.white,
              title: Text(song.name!.substring(
                  0, song.name!.length > 30 ? 30 : song.name!.length)),
              leading: Image.network(song.photo!),
              subtitle: Text(song.name!),
              trailing: const Icon(
                Icons.play_circle_filled,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
