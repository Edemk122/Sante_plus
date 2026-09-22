import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmacieMapView extends StatefulWidget {
  @override
  _PharmacieMapViewState createState() => _PharmacieMapViewState();
}

class _PharmacieMapViewState extends State<PharmacieMapView> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.1375, 1.2123); // Exemple: Lomé

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("pharmacie1"),
      position: LatLng(6.1375, 1.2123),
      infoWindow: InfoWindow(title: "Pharmacie Centrale", snippet: "Rue de Lomé"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId("pharmacie2"),
      position: LatLng(6.1450, 1.2200),
      infoWindow: InfoWindow(title: "Pharmacie Santé+", snippet: "Quartier Tsévié"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pharmacies sur la carte")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: _markers,
      ),
    );
  }
}
