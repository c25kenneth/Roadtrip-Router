import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripMap extends StatefulWidget {
  final double startingLat; 
  final double endingLat; 
  final double endingLong; 
  final double startingLong; 

  const TripMap(
      {super.key,
      required this.startingLat,
      required this.startingLong,
      required this.endingLat,
      required this.endingLong});

  @override
  State<TripMap> createState() => _TripMapState();
}

class _TripMapState extends State<TripMap> {

  // Controllable through resource carousel .
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    Set<Marker> markers = {};

      markers.add(
        Marker(
          markerId: MarkerId("starting"),
          position: LatLng(widget.startingLat,
              widget.startingLong),
          infoWindow: InfoWindow(
            title: "Starting point",
            // snippet: location['address'],
          ),
        ),
      );

      markers.add(
        Marker(
          markerId: MarkerId("ending"),
          position: LatLng(widget.endingLat, widget.endingLong),
          infoWindow: InfoWindow(
            title: "End",
            // snippet: location['address'],
          ),
        ),
      );
  

    setState(() {
      _markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.startingLat, widget.startingLong),
              zoom: 11.0,
            ),
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: 230,
          //     margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          //     child: ResourceCarousel(
          //       controller: _controller,
          //       locations: widget.locations,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}