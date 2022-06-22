import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:webadminayuntamiento/models/usuarioTemp.dart';
import 'package:flutter/services.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final usuarios = [
    Usuario(
        uid: '1',
        nombre: 'Maria Juana Osorio',
        email: 'prueba1@ejemplo.com',
        online: true,
        caracteristicas: ' No proporciono',
        telefono: '1233211231',
        latitud: '18.612993636220082',
        longitud: ' -99.17436631519939'),
  ];

  LatLng centerMap = LatLng(18.615278286574636, -99.18042458931201);

  late MapController _mapController;

//live location
//  LocationData? _currentLocation;
//  bool _liveUpdate = false;
//  bool _permission = false;
//  String? _serviceError = '';
//  var interActiveFlags = InteractiveFlag.all;
//  final Location _locationService = Location();

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
//    initLocationService();
  }

//  void initLocationService() async {
//    await _locationService.changeSettings(
//      accuracy: LocationAccuracy.high,
//      interval: 1000,
//    );
//    LocationData? location;
//    bool serviceEnabled;
//    bool serviceRequestResult;
//
//    try {
//      serviceEnabled = await _locationService.serviceEnabled();
//
//      if (serviceEnabled) {
//        var permission = await _locationService.requestPermission();
//        _permission = permission == PermissionStatus.granted;
//
//        if (_permission) {
//          location = await _locationService.getLocation();
//          _currentLocation = location;
//          _locationService.onLocationChanged
//              .listen((LocationData result) async {
//            if (mounted) {
//              setState(() {
//                _currentLocation = result;
//
//                // If Live Update is enabled, move map center
//                if (_liveUpdate) {
//                  _mapController.move(
//                      LatLng(_currentLocation!.latitude!,
//                          _currentLocation!.longitude!),
//                      _mapController.zoom);
//                }
//              });
//            }
//          });
//        }
//      } else {
//        serviceRequestResult = await _locationService.requestService();
//        if (serviceRequestResult) {
//          initLocationService();
//          return;
//        }
//      }
//    } on PlatformException catch (e) {
//      debugPrint(e.toString());
//      if (e.code == 'PERMISSION_DENIED') {
//        _serviceError = e.message;
//      } else if (e.code == 'SERVICE_STATUS_ERROR') {
//        _serviceError = e.message;
//      }
//      location = null;
//    }
//  }

  @override
  void dispose() {
//  _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Text('Centrar'),
        onPressed: () {
          // Add your onPressed code here!
          _mapController.move(centerMap, 18);
        },
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.red,
                          //child: Text(usuarios[0].nombre.substring(0, 2)),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                        SizedBox(width: 100),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              usuarios[0].nombre,
                              style: GoogleFonts.workSans(
                                  fontSize: 60, fontWeight: FontWeight.w600),
                            ),
                            Text('Telefono  ' + usuarios[0].telefono),
                            Text('Caracteristicas  ' +
                                usuarios[0].caracteristicas),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.95,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        center: centerMap,
                        zoom: 15.0,
                      ),
                      layers: [
                        TileLayerOptions(
                          minNativeZoom: 1,
                          maxNativeZoom: 18,
                          minZoom: 1,
                          maxZoom: 18,
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                          attributionBuilder: (_) {
                            return Text("© OpenStreetMap contributors");
                          },
                        ),
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(double.parse(usuarios[0].latitud),
                                  double.parse(usuarios[0].longitud)),
                              builder: (ctx) => Container(
                                child: Icon(
                                  Icons.location_on,
                                  size: 60,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Seguimiento'),
        ],
      ),
      backgroundColor: Colors.red,
    );
  }
}

class _AccountDraggableScroll extends StatefulWidget {
  const _AccountDraggableScroll({
    Key? key,
  }) : super(key: key);

  @override
  State<_AccountDraggableScroll> createState() =>
      _AccountDraggableScrollState();
}

class _AccountDraggableScrollState extends State<_AccountDraggableScroll> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 0.3,
        builder: (context, scrollController) {
          return Material(
            elevation: 20,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: ScrollButtomCall(scrollController),
          );
        });
  }
}

class ScrollButtomCall extends StatelessWidget {
  final ScrollController scrollController;
  ScrollButtomCall(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: this.scrollController,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Contactar a C2',
              style:
                  GoogleFonts.roboto(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 260,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () async {
                      _callNumber('7775636917');
                    },
                    child: Text('Llamar',
                        style: GoogleFonts.roboto(
                            fontSize: 30, fontWeight: FontWeight.bold))))
          ],
        ),
      ),
    );
  }
}

_callNumber(String phoneNumber) async {
  // String number = phoneNumber;
  // await FlutterPhoneDirectCaller.callNumber(number);
}
