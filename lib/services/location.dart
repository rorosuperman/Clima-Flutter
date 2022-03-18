import 'package:geolocator/geolocator.dart  ';
class Location{

 //Location({this.latitude,this.longitude});

  double longitude;
  double latitude;

  Future   getcurrentlocation() async{
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        print(e);
      }
    }
    }
