// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:musicappnew/modules/songs/Widgets/songbox.dart';

import '../Model/SongModel.dart';
import '../Services/songservice.dart';

class SongPage extends StatefulWidget {
  String name;
  SongPage(this.name, {super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 35, 25, 67),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            title: Text(
              widget.name,
              style: const TextStyle(fontSize: 20),
            )),
        backgroundColor: const Color.fromARGB(255, 35, 25, 67),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<List<Song>>(
              future: SongService().getSongs(widget.name),
              builder: (ctx, AsyncSnapshot<List<Song>> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something Went Wrong..."),
                  );
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, int index) {
                    Song song = snapshot.data![index];
                    return SongBox(song);
                  },
                );
              },
            ))
          ],
        ));
  }
}
