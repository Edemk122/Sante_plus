class Service {
  final String id;
  final String nom;
  final double latitude;
  final double longitude;
  final String type;

  Service({required this.id, required this.nom, required this.latitude, required this.longitude, required this.type});

  factory Service.fromMap(Map<String, dynamic> data, String id) {
    return Service(
      id: id,
      nom: data['nom'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      type: data['type'],
    );
  }
}
