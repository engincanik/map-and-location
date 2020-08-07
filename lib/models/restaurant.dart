import 'package:huawei_map/components/components.dart';

class Restaurant {
  String title;
  String motto;
  String address;
  LatLng latLng;
  String county;

  Restaurant({this.title, this.motto, this.address, this.latLng, this.county});
}

final List<Restaurant> allRestaurants = [
  Restaurant(
    title: "Restaurant 1",
    motto: "Cheap",
    address: "Kuva-i̇ Milliye, Sezgin İnan Caddesi No:104-1, 10325 Kadıköy/Edremit/Balıkesir",
    latLng: LatLng(39.599270, 26.983783),
    county: "Zeytinli",
  ),
  Restaurant(
    title: "Restaurant 2",
    motto: "Cheap",
    address: "Edremit, Kipa avm, 10300 Balıkesir",
    latLng: LatLng(39.594988, 26.979648),
    county: "Zeytinli",
  ),
  Restaurant(
    title: "Restaurant 3",
    motto: "Cheap",
    address: "Yolören, 10305 Edremit/Balıkesir",
    latLng: LatLng(39.597562, 26.972240),
    county: "Zeytinli",
  ),
  Restaurant(
    title: "Restaurant 4",
    motto: "Cheap",
    address: "Yolören, 10300 Edremit/Balıkesir",
    latLng: LatLng(39.598253, 26.978987),
    county: "Zeytinli",
  ),
  Restaurant(
    title: "Restaurant 5",
    motto: "Cheap",
    address: "Zeytinli, 10305 Edremit/Balıkesir",
    latLng: LatLng(39.596074, 26.968882),
    county: "Zeytinli",
  ),
  Restaurant(
    title: "Restaurant 1",
    motto: "Medium",
    address: "Kuva-i̇ Milliye, Sezgin İnan Caddesi No:104-1, 10325 Kadıköy/Edremit/Balıkesir",
    latLng: LatLng(39.599270, 26.983783),
    county: "Hamidiye",
  ),
  Restaurant(
    title: "Restaurant 2",
    motto: "Medium",
    address: "Edremit, Kipa avm, 10300 Balıkesir",
    latLng: LatLng(39.594988, 26.979648),
    county: "Hamidiye",
  ),
  Restaurant(
    title: "Restaurant 3",
    motto: "Medium",
    address: "Yolören, 10305 Edremit/Balıkesir",
    latLng: LatLng(39.597562, 26.972240),
    county: "Hamidiye",
  ),
  Restaurant(
    title: "Restaurant 4",
    motto: "Medium",
    address: "Yolören, 10300 Edremit/Balıkesir",
    latLng: LatLng(39.598253, 26.978987),
    county: "Hamidiye",
  ),
  Restaurant(
    title: "Restaurant 5",
    motto: "Medium",
    address: "Zeytinli, 10305 Edremit/Balıkesir",
    latLng: LatLng(39.596074, 26.968882),
    county: "Hamidiye",
  ),
];
