import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LocationData? _currentLocation;
  final Location _locationService = Location();
  final List<LatLng> _randomLocation = [
    LatLng(3.0129312075488413, 101.71819505961598),
    LatLng(2.9786552696918953, 101.77307046668818),
  ];
  // late BitmapDescriptor _markerIcon;
  late String _mapStyleString;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    rootBundle.loadString('assets/map_style.json').then((string) {
      _mapStyleString = string;
    });
    _locationService.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        _locationService.getLocation().then((location) {
          setState(() {
            _currentLocation = location;
          });
        });
      }
    });
    // _setMarkerIcon();
  }

  // Future<void> _setMarkerIcon() async {
  //   _markerIcon = await BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(size: Size(48, 48)),
  //     'assets/marker.png', // Add your custom marker asset here.
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    mapType: MapType.normal, // Disable satellite view
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _currentLocation!.latitude!,
                        _currentLocation!.longitude!,
                      ),
                      zoom: 15,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      _controller.future.then((value) {
                        value.setMapStyle(_mapStyleString);
                      });
                    },
                    myLocationEnabled: true,
                    markers: {
                      Marker(
                        markerId: const MarkerId('Prince Barbershop'),
                        position: _randomLocation[0],
                        infoWindow:
                            const InfoWindow(title: 'Prince BarberShop'),
                      ),
                      Marker(
                        markerId:
                            const MarkerId('Real Barbershop Kajang & Bangi'),
                        position: _randomLocation[1],
                        infoWindow: const InfoWindow(
                            title: 'Real Barbershop Kajang & Bangi'),
                      ),
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
