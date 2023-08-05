import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Color darkBlueColor = Color(0xFF000080);

class aboutUS extends StatefulWidget {
  const aboutUS({super.key});

  @override
  State<aboutUS> createState() => _aboutUSState();
}

class _aboutUSState extends State<aboutUS> {
  final VideoUrl = "https://youtu.be/gvMnWKEsWWs";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(VideoUrl);

    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Trash Track",
            style: TextStyle(color: Colors.green),
          ),
        ),
           leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back when the arrow icon is clicked
            },
          ),
      ),
      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blackwhitebg.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset(
                //   "assets/litter.jpg",
                //   height: 275,
                //   width: 190,
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainText("One of the major"),
                    MainText("concerns with our"),
                    MainText("environment has been"),
                    MainText("Solid waste "),
                    MainText("management the"),
                    MainText("traditionl way of"),
                    MainText("manually monitoring"),
                    MainText("waste is a "),
                    MainText("cumbersome process"),
                    MainText("requiring more human"),
                    MainText("effort, time and cost. "),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:220),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText2("This is our solution a",),
                      MainText2("method to automate"),
                      MainText2("waste collection. This"),
                      MainText2("is our Smart Waste "),
                      MainText2("Management system "),
                      MainText2("an innovative way to "),
                      MainText2("keep the city clean"),
                      MainText2("and healthy. "),
                    ],
                  ),
                ),
                // Image.asset(
                //   "assets/WasteCollection.jpg",
                //   height: 200,
                //   width: 200,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget MainText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 17, color: Colors.black),
    );
  }

  Widget MainText2(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 17, color: Colors.white),
    );
  }
}
