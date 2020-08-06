import 'package:huawei_map/components/components.dart';

class Restaurant {
  String title;
  String motto;
  String address;
  LatLng latLng;

  Restaurant({this.title, this.motto, this.address, this.latLng});
}

final List<Restaurant> zeytinli = [
  Restaurant(
    title: "Restaurant 1",
    motto: "Cheap",
    address: "Kuva-i̇ Milliye, Sezgin İnan Caddesi No:104-1, 10325 Kadıköy/Edremit/Balıkesir",
    latLng: LatLng(39.599270, 26.983783),
  ),
  Restaurant(
    title: "Restaurant 2",
    motto: "Cheap",
    address: "Edremit, Kipa avm, 10300 Balıkesir",
    latLng: LatLng(39.594988, 26.979648),
  ),
  Restaurant(
    title: "Restaurant 3",
    motto: "Cheap",
    address: "Yolören, 10305 Edremit/Balıkesir",
    latLng: LatLng(39.597562, 26.972240),
  ),
  Restaurant(
    title: "Restaurant 4",
    motto: "Cheap",
    address: "Yolören, 10300 Edremit/Balıkesir",
    latLng: LatLng(39.598253, 26.978987),
  ),
  Restaurant(
    title: "Restaurant 5",
    motto: "Cheap",
    address: "Zeytinli, 10305 Edremit/Balıkesir",
    latLng: LatLng(39.596074, 26.968882),
  ),
];

final List<List> allRestaurants = [
  zeytinli,
];