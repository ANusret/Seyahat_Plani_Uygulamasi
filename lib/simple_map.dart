import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gmap/ilkrotas1.dart';
import 'package:gmap/ilkrotas2.dart';
import 'package:gmap/mekan.dart';
import 'package:gmap/models/konumkayit.dart';
import 'package:gmap/models/mekan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_distance_calculator/location_distance_calculator.dart';

import 'kayitlirota.dart';

enum Action1 { ekle }

class MapScreen extends StatefulWidget {
  final Action1 action;
  const MapScreen({
    Key? key,
    this.action = Action1.ekle,
  }) : super(key: key);

  static Marker marker = Marker(markerId: MarkerId("baslangic"));
  static Marker bitisMarker = Marker(markerId: MarkerId("bitis"));

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  double _distance = 0.0;


  @override
  void initState() {
    //addCustomIcon();
    mekanlarGet();
    super.initState();
  }



  mekanlarGet() async {
    Mekan m1 = Mekan();
    await m1.getMekan();
    int a = 0;
    m1.mekanList.forEach((element) {
      print("_#MekanList $a ad: ${m1.mekanList[a].ad.toString()}");
      print("_#MekanList $a puan: ${m1.mekanList[a].puan.toString()}");
      a++;
      mekanSet.add(Marker(
          markerId: MarkerId(element.ad),
          position: LatLng(element.lat, element.lng)));
    });
    mekanlarSet.add(MapScreen.marker);
    mekanlarSet.add(MapScreen.bitisMarker);
    mekanlar.forEach((element) {
      mekanlarSet.add(element);
    });
    setState(() {});
  }

  Future<void> initPlatformState() async {
    double distance;
    try {
      distance = await LocationDistanceCalculator().distanceBetween(
          MapScreen.marker.position.latitude,
          MapScreen.marker.position.longitude,
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text("asdsf", style: optionStyle)
  ];
  void _navDokun(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  Mekan m1 = Mekan();

  List<Marker> mekanlar = [];
  Marker secilenmekanMarker = Marker(markerId: MarkerId("yer"));
  Set<Marker> mekanlarSet = {};
  Set<Marker> mekanSet = {};
  final Set<Polyline> _polyline = {};

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
          target: LatLng(37.456603, 30.590059),
          zoom: 14,
        ),
        markers: mekanlarSet,
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        onLongPress: (LatLng position) async {
          setState(() {
            print(MapScreen.marker.position.latitude);
            if (MapScreen.marker.position == LatLng(0.0, 0.0)) {
              print("Bitiş değişti");
              MapScreen.marker = Marker(
                  markerId: MarkerId("baslangic"),
                  position: position,
                  draggable: true);
              mekanlarSet.add(MapScreen.marker);
            } else {
              if (MapScreen.bitisMarker.position == LatLng(0.0, 0.0)) {
                print(
                    "Bitiş değişti, yeni konum ${MapScreen.bitisMarker.position}");
                MapScreen.bitisMarker = Marker(
                    markerId: MarkerId("bitis"),
                    position: position,
                    draggable: true);
                mekanlarSet.add(MapScreen.marker);
              } else {
                MapScreen.marker = Marker(
                    markerId: MarkerId("baslangic"),
                    position: LatLng(0.0, 0.0),
                    draggable: true);
                MapScreen.bitisMarker = Marker(
                    markerId: MarkerId("bitis"),
                    position: LatLng(0.0, 0.0),
                    draggable: true);
                mekanlarSet.clear();
                polylines.clear();
                polylineCoordinates = [];
              }
            }
          });
          _getPolyLine();
          initPlatformState();
        },
        polylines: Set<Polyline>.of(polylines.values),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF673AB7),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Color(0xFF673AB7),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          minimumSize: Size(225, 40),
                          maximumSize: Size(225, 40),
                        ),
                        child: Text(
                          '${mekanlarSet.elementAt(1).markerId.value.toString()}',
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 18),
                        ),
                        onPressed: () async {
                          _polyline.add(Polyline(
                            polylineId: PolylineId('1'),
                            points: [
                              LatLng(MapScreen.marker.position.latitude,
                                  MapScreen.marker.position.longitude),
                              LatLng(mekanlarSet.elementAt(1).position.latitude,
                                  mekanlarSet.elementAt(1).position.longitude),
                              LatLng(MapScreen.bitisMarker.position.latitude,
                                  MapScreen.bitisMarker.position.longitude)
                            ],
                            color: Color(0xFF673AB7),
                          ));
                          print(mekanlarSet);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ilkrotas1(mekanlarSet: mekanlarSet),
                              ));
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          minimumSize: Size(225, 40),
                          maximumSize: Size(225, 40),
                        ),
                        child: Text(
                          '${mekanlarSet.elementAt(2).markerId.value.toString()}',
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 18),
                        ),
                        onPressed: () async {
                          _polyline.add(Polyline(
                            polylineId: PolylineId('2'),
                            points: [
                              LatLng(MapScreen.marker.position.latitude,
                                  MapScreen.marker.position.longitude),
                              LatLng(mekanlarSet.elementAt(2).position.latitude,
                                  mekanlarSet.elementAt(2).position.longitude),
                              LatLng(MapScreen.bitisMarker.position.latitude,
                                  MapScreen.bitisMarker.position.longitude)
                            ],
                            color: Color(0xFF673AB7),
                          ));
                          print(mekanlarSet);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ilkrotas2(mekanlarSet: mekanlarSet),
                              ));
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          minimumSize: Size(225, 40),
                          maximumSize: Size(225, 40),
                        ),
                        onPressed: () async {
                          var kayit = KayitModel(
                            lat1: MapScreen.marker.position.latitude,
                            lat2: MapScreen.bitisMarker.position.latitude,
                            lon1: MapScreen.marker.position.longitude,
                            lon2: MapScreen.bitisMarker.position.longitude,
                          );

                          await FirebaseFirestore.instance
                              .collection("rotalar")
                              .add(kayit.toJson());


                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => rotalar()));
                        },
                        child: Text(
                          "Rotayı kaydet",
                          style:
                              TextStyle(color: Colors.deepPurple, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: Text(
          'Mekan\n  öner',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }

  _getPolyLine() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAxh2_ryguz9TlfFE-AIAu0aYy1hQ4SyQs',
      PointLatLng(MapScreen.marker.position.latitude,
          MapScreen.marker.position.longitude),
      PointLatLng(MapScreen.bitisMarker.position.latitude,
          MapScreen.bitisMarker.position.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        mekanSet.forEach((element) {
          MekanModel a1 = new MekanModel(ad: '', puan: 0, lat: 0.00, lng: 0.00);
          MekanModel a2 = new MekanModel(ad: '', puan: 0, lat: 0.00, lng: 0.00);
          if ((element.position.latitude > point.latitude - 0.0025) &&
              (element.position.latitude < point.latitude + 0.0025) &&
              (element.position.longitude > point.longitude - 0.0025) &&
              (element.position.longitude < point.longitude + 0.0025)) {
            if (mekanlarSet.length == 3) {
              for (Marker value in mekanlarSet) {
                for (int i = 0; i < m1.mekanList.length; i++) {
                  if (m1.mekanList[i].lng == element.position.longitude &&
                      m1.mekanList[i].lat == element.position.latitude) {
                    a1 = m1.mekanList[i];
                  }
                  if (m1.mekanList[i].lng == value.position.longitude &&
                      m1.mekanList[i].lat == value.position.latitude) {
                    a2 = m1.mekanList[i];
                  }
                }
                if (a1.puan > a2.puan) {
                  mekanlarSet.remove(a2);
                  mekanlarSet.add(Marker(
                      markerId: MarkerId('${a1.ad}'),
                      position: LatLng(a1.lat, a1.lng),
                      draggable: false));
                }
              }
            } else {
              mekanlarSet.add(element);
            }
          }
        });
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.purple, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }
}
