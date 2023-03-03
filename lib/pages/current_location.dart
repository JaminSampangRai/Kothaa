import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(28.1407285, 84.6008093), zoom: 14);
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: SizedBox(
        height: 350,
        width: 350,
        child: SizedBox(
          child: Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: initialCameraPosition,
                  markers: markers,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                ),
              ),
              // FloatingActionButton(
              //   onPressed: () {},
              // )
              FloatingActionButton.extended(
                onPressed: () async {
                  Position position = await _determinePositon();
                  googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition((CameraPosition(
                          target: LatLng(position.latitude, position.longitude),
                          zoom: 14))));
                  markers.clear();
                  markers.add(Marker(
                      markerId: const MarkerId('currentLocation'),
                      position: LatLng(position.latitude, position.longitude)));
                  setState(() {});
                },
                label: const Text("Current Location"),
                icon: const Icon(Icons.location_history_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Position> _determinePositon() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied permanently");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
