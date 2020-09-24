import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations= [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata' ,flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London' ,flag: 'uk.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo' ,flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago' ,flag: 'usa.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore' ,flag: 'china.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo' ,flag: 'japan.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris' ,flag: 'france.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin' ,flag: 'germany.png'),

  ];

  void updateTime(index) async
  {
    WorldTime inst= locations[index];
    await inst.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location' :inst.location,
      'flag': inst.flag,
      'time' :inst.time,
      'isDaytime' :inst.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(

        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 3.0, 0, 2.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assest/${locations[index].flag}'),
                )
              )
            ),
          );
        }
      ),
    );
  }
}
