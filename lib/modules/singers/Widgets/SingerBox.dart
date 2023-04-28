// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:musicappnew/modules/singers/model/SingerModel.dart';

import '../../songs/Pages/SongPage.dart';

// ignore: must_be_immutable
class SingerBox extends StatelessWidget {
  Singer singer;
  SingerBox(this.singer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => SongPage(singer.name)));
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: NetworkImage(singer.photo), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(255, 53, 43, 84))),
            ),
          ),
        ),
        Positioned(
          bottom: 17,
          left: 45,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SongPage(singer.name)));
            },
            child: Text(
              singer.name,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => SongPage(singer.name)));
            },
            child: const CircleAvatar(
              maxRadius: 14,
              backgroundColor: Colors.black,
              foregroundColor: Colors.transparent,
              child: Icon(
                Icons.play_arrow,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
