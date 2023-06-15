import 'package:flutter/material.dart';

Color darkBlueColor = Color(0xFF000080);

class dustbinDetailPage extends StatefulWidget {
  const dustbinDetailPage({super.key});

  @override
  State<dustbinDetailPage> createState() => _dustbinDetailPageState();
}

class _dustbinDetailPageState extends State<dustbinDetailPage> {
  double progress = 0.75;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      appBar: appbar(),
      // body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 30),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        value: progress, // Set the current progress value
                        strokeWidth:
                            8, // Adjust the thickness of the progress indicator
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Title(
                    color: Colors.white,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dustbin A",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Location: Patan durbar",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                middle_text("The sensors in the dustbin"),
                middle_text("will notify you on how full"),
                middle_text("it is and also throw an alert"),
                middle_text("when the trash fill is over 75%")
              ],
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  child: Image.asset("assets/dustbinIcon.png"),
                ),
                SizedBox(width: 20,),
                Container(
                  height: 90,
                  width: 90,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Text("OPEN",style: TextStyle(fontSize: 23),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget middle_text(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
    );
  }

// Appbar
  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Color.fromARGB(255, 10, 106, 13),
      title: Title(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Trash Track",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/brandlogo.png",
              height: 60,
              width: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget info_text(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
