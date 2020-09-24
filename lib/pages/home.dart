import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {
   data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

//    print(data);
   //set background image
   String img=data['isDaytime'] ? 'day.png' : 'night1.png' ;
    Color bg= data['isDaytime'] ? Colors.amberAccent : Colors.blueAccent;
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/$img'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'location' :result['location'],
                           'flag': result['flag'],
                           'time' :result['time'],
                           'isDaytime' :result['isDaytime'],
                         };
                       });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[900],
                      ),
                      label: Text(
                          'Edit Location',
                          style :TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[900],
                          )
                      ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.grey[900],
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.grey[900],
                    ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
