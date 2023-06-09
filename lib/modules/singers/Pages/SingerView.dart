// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicappnew/modules/singers/Widgets/SingerBox.dart';

import '../Services/SingerService.dart';
import '../model/SingerModel.dart';

class SingerView extends StatefulWidget {
  const SingerView({super.key});

  @override
  State<SingerView> createState() => _SingerViewState();
}

class _SingerViewState extends State<SingerView> {
  bool isSorted = false;
  final SingerService _singerService = SingerService();

  // List<Singer> singer = [];

  @override
  void initState() {
    super.initState();
    // Future<List<Singer>> future = _singerService.getSingers();
    // future.then((List<Singer> singer) {
    //   this.singer = singer;
    //   //C
    // }).catchError((e) => print("Error is $e"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 35, 25, 67),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Singers'),
          backgroundColor: const Color.fromARGB(255, 35, 25, 67),
          leading: IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isSorted = !isSorted;
                  });
                },
                icon: const Icon(Icons.sort_by_alpha_sharp))
          ],
        ),
        body: FutureBuilder<List<Singer>>(
          future: _singerService.getSingers(),
          builder: (context, AsyncSnapshot<List<Singer>> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something Went Wrong...");
            } else if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
              ));
            }
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, int index) {
                /*
                The code below is used to arrange the data of 
                snapshot either in ascending or descending format 
                as the sort button is pressed.
                */
                isSorted
                    ? snapshot.data!.sort((a, b) =>
                        a.name.toLowerCase().compareTo(b.name.toLowerCase()))
                    : snapshot.data!;
                Singer singer = snapshot.data![index];

                return SingerBox(singer);
              },
            );
          },
        ));
  }
}
