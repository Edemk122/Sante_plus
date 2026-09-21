class Rendezvous {
  final String id;
  final String centre;
  final DateTime date;

  Rendezvous({required this.id, required this.centre, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'centre': centre,
      'date': date.toIso8601String(),
    };
  }

  factory Rendezvous.fromMap(Map<String, dynamic> data, String id) {
    return Rendezvous(
      id: id,
      centre: data['centre'],
      date: DateTime.parse(data['date']),
    );
  }
}
