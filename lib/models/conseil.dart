class Conseil {
  final String id;
  final String titre;
  final String description;

  Conseil({required this.id, required this.titre, required this.description});

  factory Conseil.fromMap(Map<String, dynamic> data) {
    return Conseil(
      id: data['id'],
      titre: data['titre'],
      description: data['description'],
    );
  }
}
