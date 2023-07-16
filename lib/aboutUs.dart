import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Color darkBlueColor = Color(0xFF000080);

class aboutUS extends StatefulWidget {
  const aboutUS({super.key});

  @override
  State<aboutUS> createState() => _aboutUSState();
}

class _aboutUSState extends State<aboutUS> {
  final VideoUrl = "https://youtu.be/lHhRhPV--G0";

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
      ),
      body: Column(
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
              Image.asset(
                "assets/litter.jpg",
                height: 275,
                width: 190,
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText("This is our solution a"),
                  MainText("method to automate"),
                  MainText("waste collection. This"),
                  MainText("is our Smart Waste "),
                  MainText("Management system "),
                  MainText("an innovative way to "),
                  MainText("keep the city clean"),
                  MainText("and healthy. "),
                ],
              ),
              Image.asset(
                "assets/WasteCollection.jpg",
                height: 200,
                width: 200,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget MainText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
    );
  }
}
