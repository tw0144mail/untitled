import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/resource/strings.dart';
import '../default_ui/next_page_preset_class.dart';

class Map extends StatefulWidget {
  Map({Key? key}) : super(key: key);

  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.546162, 120.6402133),
    zoom: 10.0,
  );

  static const CameraPosition _kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(25.0332915,121.5630238),
      // tilt: 59.440717697143555,
      zoom: 17.0);

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
        title: strings.GuidePage,
        body: Scaffold(
          body: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _goToTheLake,
            label: const Text('看看101ＯＷＯ'),
            icon: const Icon(Icons.hail),
          ),
        ));


  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
