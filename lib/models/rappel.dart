class Rappel {
  final int id;
  final String titre;
  final DateTime date;

  Rappel({required this.id, required this.titre, required this.date});

  Map<String, dynamic> toMap() {
    return {'id': id, 'titre': titre, 'date': date.toIso8601String()};
  }

  factory Rappel.fromMap(Map<String, dynamic> map) {
    return Rappel(
      id: map['id'],
      titre: map['titre'],
      date: DateTime.parse(map['date']),
    );
  }
}
