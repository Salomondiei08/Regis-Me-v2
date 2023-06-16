import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:regis_me/models/entreprise.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.entreprise});

  final Entreprise entreprise;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.entreprise.nom),
      ),
      body: FlutterMap(
        options: MapOptions(
            center: LatLng(
                widget.entreprise.lattitude, widget.entreprise.longitude)),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            tileProvider: NetworkTileProvider(),
          ),
        ],
      ),
    );
  }
}
