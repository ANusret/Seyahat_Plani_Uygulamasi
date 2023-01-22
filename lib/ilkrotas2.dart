import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gmap/ikincirotas2.dart';
import 'package:gmap/simple_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_distance_calculator/location_distance_calculator.dart';

class ilkrotas2 extends StatefulWidget {
  ilkrotas2({Key? key, required this.mekanlarSet}) : super(key: key);
  Set<Marker> mekanlarSet;

  @override
  State<ilkrotas2> createState() => _ilkrotas2State();
}

class _ilkrotas2State extends State<ilkrotas2> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> _markers = Set<Marker>();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  double _distance = 0.0;

  @override
  void initState() {
    //addCustomIcon();
    initPlatformState();

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
          MapScreen.marker.position.latitude,
          MapScreen.marker.position.longitude,
          widget.mekanlarSet.elementAt(2).position.latitude,
          widget.mekanlarSet.elementAt(2).position.longitude);
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
          target: MapScreen.marker.position,
          zoom: 15,
        ),
        markers: _markersGet(),
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        polylines: Set<Polyline>.of(polylines.values),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF673AB7),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ikincirotas2(mekanlarSet: widget.mekanlarSet)));
        },
        label: Text('bir sonraki\n rotaya geç'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }

  _markersGet() {
    _markers.add(widget.mekanlarSet.elementAt(0));
    _markers.add(widget.mekanlarSet.elementAt(2));
    return _markers;
  }

  _getPolyLine() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAxh2_ryguz9TlfFE-AIAu0aYy1hQ4SyQs',
      PointLatLng(widget.mekanlarSet.elementAt(0).position.latitude,
          widget.mekanlarSet.elementAt(0).position.longitude),
      PointLatLng(widget.mekanlarSet.elementAt(2).position.latitude,
          widget.mekanlarSet.elementAt(2).position.longitude),
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
