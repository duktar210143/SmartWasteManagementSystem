import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'motorControll.dart';

Color darkBlueColor = Color(0xFF000080);

class dustbinDetailPage extends StatefulWidget {
  const dustbinDetailPage({super.key});

  @override
  State<dustbinDetailPage> createState() => _dustbinDetailPageState();
}

class _dustbinDetailPageState extends State<dustbinDetailPage> {
  MotorControlScreen motorControlScreenInstance = MotorControlScreen();
  double progress = 0;
  bool isMotorOpen = true;

  void toggleMotorState() {
    if (isMotorOpen) {
      motorControlScreenInstance.openMotor();
    } else {
      motorControlScreenInstance.closeMotor();
    }
    setState(() {
      isMotorOpen = !isMotorOpen;
    });
  }

  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('sensor_data');

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  void initializeNotifications() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    // fetchData();

    return Scaffold(
      backgroundColor: darkBlueColor,
      appBar: appbar(),
      // body
      body: StreamBuilder<DatabaseEvent>(
          stream: databaseRef.onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DataSnapshot? dataSnapshot = snapshot.data!.snapshot;
              dynamic fetchedData = dataSnapshot.value;
              print(fetchedData);
              progress = fetchedData?.toDouble() ?? 0;
              if (progress > 90) {
                _showNotification();
              }
              // process the retrived data
              return Column(
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
                                value: progress.toDouble() / 100,
                                // Set the current progress value
                                strokeWidth:
                                    8, // Adjust the thickness of the progress indicator
                              ),
                            ),
                            Text(
                              '${(progress).toInt()}%',
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
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
                        middle_text("when the trash fill is over 90%")
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
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          child: FloatingActionButton(
                            onPressed: toggleMotorState,
                            backgroundColor: isMotorOpen ? Colors.blue:Colors.red,
                            child: Text(
                              isMotorOpen ? "OPEN":"Close",
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  // ignore: non_constant_identifier_names
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

// fetching sensor data from firebase realtime database
  // Future<void> fetchData() async {
  //   databaseRef.once().then((DatabaseEvent event) {
  //     DataSnapshot snapshot = event.snapshot;
  //     dynamic data = snapshot.value;
  //     // Process the retrieved data
  //     print(data);
  //   });
  // }

  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Dustbin filled',
      'The trash fill is over 90% please collect the waste',
      platformChannelSpecifics,
    );
  }
}
