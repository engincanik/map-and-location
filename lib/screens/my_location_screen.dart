import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:huawei_location/location/fused_location_provider_client.dart';
import 'package:huawei_location/location/hwlocation.dart';
import 'package:huawei_location/location/location.dart';
import 'package:huawei_location/location/location_request.dart';
import 'package:huawei_location/permission/permission_handler.dart';

class MyLocation extends StatefulWidget {
  static const String routeName = "MyLocationScreen";

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  PermissionHandler permissionHandler;
  FusedLocationProviderClient locationProviderClient;
  LocationRequest locationRequest;

  String infoText = "Unknown";
  int requestCode;

  @override
  void initState() {
    super.initState();
    locationProviderClient = FusedLocationProviderClient();
    permissionHandler = PermissionHandler();
    locationRequest = LocationRequest();
//    locationRequest.interval = 5000;
  }

  void getLastLocation() async {
    setState(() {
      infoText = "";
    });
    try {
      Location location = await locationProviderClient.getLastLocation();
      setState(() {
        infoText = location.toString();
      });
    } catch (e) {
      setState(() {
        infoText = e.toString();
      });
    }
  }

  void getLastLocationWithAddress() async {
    try {
      locationRequest.needAddress = true;
      HWLocation hwLocation = await locationProviderClient
          .getLastLocationWithAddress(locationRequest);
      setState(() {
        infoText = hwLocation.toString();
      });
    } catch (e) {
      setState(() {
        infoText = e.toString();
      });
    }
  }

  void hasPermission() async {
    try {
      bool status = await permissionHandler.hasLocationPermission();
      setState(() {
        infoText = "Has permission: $status";
      });
    } catch (e) {
      setState(() {
        infoText = e.toString();
      });
    }
  }

  void requestPermission() async {
    try {
      bool status = await permissionHandler.requestLocationPermission();
      setState(() {
        infoText = "Is permission granted $status";
      });
    } catch (e) {
      setState(() {
        infoText = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Fused Location"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                height: 250,
                child: AutoSizeText(
                  infoText,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Divider(
                thickness: 0.1,
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: hasPermission,
                child: Text("IsPermissions"),
              ),
              RaisedButton(
                onPressed: requestPermission,
                child: Text("RequestPermission"),
              ),
              RaisedButton(
                onPressed: getLastLocationWithAddress,
                child: Text("Last location with address"),
              ),
              RaisedButton(
                onPressed: getLastLocation,
                child: Text("Last location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
