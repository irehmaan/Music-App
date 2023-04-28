import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:musicappnew/shared/config.dart';

class SplashOne extends StatelessWidget {
  const SplashOne({super.key});

  final url = Constants.Splash_logo_url;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            width: media.width,
            height: media.height,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(image: NetworkImage(url))),
          ),
          Transform.scale(
            scale: 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Center(
                  heightFactor: 17,
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
