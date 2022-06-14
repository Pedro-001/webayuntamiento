import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:location/location.dart' as loc;
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
////location
//  final loc.Location location = loc.Location();
//  StreamSubscription<loc.LocationData>? _locationSubscription;
//
////initial position
//  static const _initialCameraPosition = CameraPosition(
//      target: LatLng(18.61550976854836, -99.18107791304976), zoom: 18);
//
//  late GoogleMapController _googleMapController;
//  final TextEditingController _numberCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
//    _numberCtrl.text = "7343420587";
  }

  @override
  void dispose() {
//  _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                Container(),
              ],
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(51.5, -0.09),
                      zoom: 13.0,
                    ),
                    layers: [
                      TileLayerOptions(
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
                            point: LatLng(51.5, -0.09),
                            builder: (ctx) => Container(
                              child: FlutterLogo(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
          CircleAvatar(
            backgroundColor: Colors.red,
            child: Text('MJ'),
          ),
          Text('Usuario  MJ'),
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
