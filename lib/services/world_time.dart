import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name
  String time; //time in the location
  String flag;
  String url; //location url for api endpoints
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url });

  Future<void> getTime() async{

    try{
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
//    print(data);

//    get properties from data
      String datetime= data['datetime'];
      String offsethrs =data['utc_offset'].substring(1,3);
      String offsetmin =data['utc_offset'].substring(4,6);
//      print(datetime);
//      print(offsetmin);

      //create a datetime object
      DateTime now =DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsethrs) , minutes: int.parse(offsetmin) ));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      //set time property
      time= DateFormat.jm().format(now);

    }
    catch(e)
    {
      print('caught error : $e');
      time= 'Could not get time DATA!';
    }

  }

}

//WorldTime int= WorldTime(location: 'Berlin' ,flag: 'germany.png' );