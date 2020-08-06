import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huawei_map/components/cameraUpdate.dart';
import 'package:huawei_map/map.dart';
import 'package:map_flutter/locationCard.dart';
import 'package:map_flutter/models/restaurant.dart';

class CardList extends StatelessWidget {
  HuaweiMapController mapController;
  double _zoomMarker = 18;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: allRestaurants[0].length,
        itemBuilder: (BuildContext context, int index) {
          Restaurant currentLocationRes = allRestaurants[0][index];
          return Container(
            child: InkWell(
              onTap: () {
                CameraUpdate cameraUpdate =
                CameraUpdate.newLatLngZoom(currentLocationRes.latLng, _zoomMarker);
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
    );
  }
}
