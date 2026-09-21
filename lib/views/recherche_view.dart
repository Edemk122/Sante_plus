import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/service_controller.dart';

class RechercheView extends StatefulWidget {
  @override
  _RechercheViewState createState() => _RechercheViewState();
}

class _RechercheViewState extends State<RechercheView> {
  late GoogleMapController mapController;
  final ServiceController controller = ServiceController();
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadServices();
  }

  Future<void> _loadServices() async {
    final services = await controller.getServices();
    setState(() {
      _markers.clear();
      for (var s in services) {
        _markers.add(
          Marker(
            markerId: MarkerId(s.id),
            position: LatLng(s.latitude, s.longitude),
            infoWindow: InfoWindow(title: s.nom, snippet: s.type),
          ),
        );
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recherche Services")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(6.1375, 1.2123), // Exemple : Lomé
          zoom: 13.0,
        ),
        markers: _markers,
      ),
    );
  }
}
