import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    // stimulate network request for a username
//    await Future.delayed(Duration(seconds: 3), (){
//      print('Parth');
//    });
//    Response response= await get('https://jsonplaceholder.typicode.com/todos/1');
//    Map data= jsonDecode(response.body);
//    print(data['userId']);
  }
  String time='loading';

  void setupWorldTime() async {
    WorldTime ist= WorldTime(location: 'Kolkata' ,flag: 'kolkata.png' ,url: 'Asia/Kolkata');
    await ist.getTime();
    Navigator.pushReplacementNamed(context, '/home' ,arguments: {
      'location' :ist.location,
      'flag': ist.flag,
      'time' :ist.time,
      'isDaytime' :ist.isDaytime,
    });
//    print(ist.time);
//    setState(() {
//      time= ist.time;
//    });
  }

  @override
  void initState() {
    super.initState();
//    getTime();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 130.0,
        ),
      )
    );
  }
}
