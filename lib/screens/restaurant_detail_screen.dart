import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huawei_map/map.dart';
import 'package:map_flutter/locationCard.dart';
import 'package:map_flutter/models/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  Restaurant selectedRestaurant;
  LatLng currentLocation;
  Set<Marker> selectedMarker;
  HuaweiMapController mapController;

  RestaurantDetailScreen(Restaurant restaurant, LatLng latLng) {
    selectedRestaurant = restaurant;
    currentLocation = latLng;
    selectedMarker = {
      Marker(
        markerId: MarkerId("selectedRes"),
        position: LatLng(selectedRestaurant.latLng.lat, selectedRestaurant.latLng.lng),
        infoWindow: InfoWindow(
          title: selectedRestaurant.title,
          snippet: selectedRestaurant.motto,
        ),
        clickable: false,
      ),
    };
  }

  void _onMapCreated(HuaweiMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedRestaurant.title,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amberAccent, width: 2),
              ),
              child: HuaweiMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: currentLocation,
                  zoom: 12,
                ),
                mapType: MapType.normal,
                tiltGesturesEnabled: true,
                buildingsEnabled: true,
                compassEnabled: true,
                zoomControlsEnabled: false,
                rotateGesturesEnabled: true,
                trafficEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: selectedMarker,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: 400,
                child: InkWell(
                  onTap: () {
                    CameraUpdate cameraUpdate =
                        CameraUpdate.newLatLngZoom(selectedRestaurant.latLng, 18);
                    mapController.animateCamera(cameraUpdate);
                  },
                  child: LocationCard(
                    title: selectedRestaurant.title,
                    motto: selectedRestaurant.motto,
                    address: selectedRestaurant.address,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
