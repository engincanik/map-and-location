import 'package:flutter/material.dart';
import 'package:huawei_map/components/components.dart';
import 'package:huawei_map/map.dart';
import 'package:map_flutter/locationCard.dart';
import 'package:map_flutter/models/restaurant.dart';
import 'package:map_flutter/screens/my_location_screen.dart';
import 'package:map_flutter/widgets/location_card_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HuaweiMapController mapController;
  List<Restaurant> restaurantList;
  List<LocationCard> locationList;
  static const LatLng _center = const LatLng(41.027470, 28.99339);
  static const double _zoom = 12;
  static const double _zoomMarker = 18;

  static const LatLng _location1 = const LatLng(41.036243, 28.981791);
  static const LatLng _location2 = const LatLng(41.029438, 28.975398);
  static const LatLng _location3 = const LatLng(41.032481, 28.975727);
  Set<Marker> _nMarkers = {};
  Set<Marker> _markers = {
    Marker(markerId: MarkerId("Location1"), position: _location1),
    Marker(markerId: MarkerId("Location2"), position: _location2),
    Marker(markerId: MarkerId("Location3"), position: _location3),
  };

  Set<Marker> getMarkers() {
    for (Restaurant restaurant in allRestaurants[0]) {
      print(restaurant.latLng.lng);
      LatLng _location = LatLng(restaurant.latLng.lat, restaurant.latLng.lng);
      Marker marker = Marker(markerId: MarkerId("Location1"), position: _location);
      _nMarkers.add(marker);
    }
    return _nMarkers;
  }

  void getList() {
    restaurantList = allRestaurants[0];
    for (Restaurant restaurantItem in restaurantList) {
      locationList[restaurantList.indexOf(restaurantItem)].title =
          restaurantItem.title;
      locationList[restaurantList.indexOf(restaurantItem)].motto =
          restaurantItem.motto;
      locationList[restaurantList.indexOf(restaurantItem)].address =
          restaurantItem.address;
    }
  }

  void _onMapCreated(HuaweiMapController controller) {
    mapController = controller;
  }

  void routeToMyLocation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyLocation()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Locations"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: HuaweiMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: _zoom,
                  ),
                  mapType: MapType.normal,
                  tiltGesturesEnabled: true,
                  buildingsEnabled: true,
                  compassEnabled: true,
                  zoomControlsEnabled: false,
                  rotateGesturesEnabled: true,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  trafficEnabled: false,
                  markers: getMarkers(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: allRestaurants[0].length,
                        itemBuilder: (BuildContext context, int index) {
                          Restaurant currentLocationRes =
                              allRestaurants[0][index];
                          return Container(
                            child: InkWell(
                              onTap: () {
                                CameraUpdate cameraUpdate =
                                    CameraUpdate.newLatLngZoom(
                                        currentLocationRes.latLng, _zoomMarker);
                                mapController.animateCamera(cameraUpdate);
                              },
                              child: LocationCard(
                                title: currentLocationRes.title,
                                motto: currentLocationRes.motto,
                                address: currentLocationRes.address,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    RaisedButton(
                      onPressed: routeToMyLocation,
                      child: Text("Go to My Location Page"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//InkWell(
//onTap: () {
//CameraUpdate cameraUpdate =
//CameraUpdate.newLatLngZoom(_location1, _zoomMarker);
//mapController.animateCamera(cameraUpdate);
//},
//child: LocationCard(
//title: "Location 1",
//motto: "A Fine Dining Restaurant",
//address:
//"Gümüşsuyu, Bekar Sk. No 18, 34435 Beyoğlu/İstanbul",
//),
//),
//InkWell(
//onTap: () {
//CameraUpdate cameraUpdate =
//CameraUpdate.newLatLngZoom(_location2, _zoomMarker);
//mapController.animateCamera(cameraUpdate);
//},
//child: LocationCard(
//title: "Location 2",
//motto: "A Restaurant with an Extraordinary View",
//address:
//"Şahkulu, 2, İstiklal Cd. No:231, 34421 Beyoğlu/İstanbul Türkiye",
//),
//),
//InkWell(
//onTap: () {
//CameraUpdate cameraUpdate =
//CameraUpdate.newLatLngZoom(_location3, _zoomMarker);
//mapController.animateCamera(cameraUpdate);
//},
//child: LocationCard(
//title: "Location 3",
//motto: "A Casual Dining Restaurant",
//address:
//"Asmalı Mescit Mh İstiklal Cad. &, Kallavi Sk. No:13/1, 34430 Beyoğlu",
//),
//),
