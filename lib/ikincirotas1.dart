import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gmap/simple_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_distance_calculator/location_distance_calculator.dart';

class ikincirotas1 extends StatefulWidget {
  ikincirotas1({Key? key, required this.mekanlarSet}) : super(key: key);
  Set<Marker> mekanlarSet;

  @override
  State<ikincirotas1> createState() => _ikincirotas1State();
}

class _ikincirotas1State extends State<ikincirotas1> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> _markers = Set<Marker>();
  //Set<Marker> mekanlar = widget.mekanlarSet;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  double _distance = 0.0;

  @override
  void initState() {
    //addCustomIcon();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _getPolyLine();
        initPlatformState();
      });
    });
    super.initState();
  }

  Future<void> initPlatformState() async {
    double distance;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      distance = await LocationDistanceCalculator().distanceBetween(
          widget.mekanlarSet.elementAt(1).position.latitude,
          widget.mekanlarSet.elementAt(1).position.longitude,
          MapScreen.bitisMarker.position.latitude,
          MapScreen.bitisMarker.position.longitude);
    } on PlatformException {
      distance = -1.0;
    }

    if (!mounted) return;

    setState(() {
      _distance = distance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Mesafe: ${(0.001 * (_distance).toInt()).toStringAsFixed(2)} km'),
        backgroundColor: Color(0xFF673AB7),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: widget.mekanlarSet.elementAt(1).position,
          zoom: 15.5,
        ),
        markers: _markersGet(),
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        polylines: Set<Polyline>.of(polylines.values),
      ),
    );
  }

  _markersGet() {
    _markers.add(widget.mekanlarSet.elementAt(1));
    _markers.add(MapScreen.bitisMarker);
    print(widget.mekanlarSet);
    return _markers;
  }

  _getPolyLine() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAxh2_ryguz9TlfFE-AIAu0aYy1hQ4SyQs',
      PointLatLng(widget.mekanlarSet.elementAt(1).position.latitude,
          widget.mekanlarSet.elementAt(1).position.longitude),
      PointLatLng(MapScreen.bitisMarker.position.latitude,
          MapScreen.bitisMarker.position.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }
}
