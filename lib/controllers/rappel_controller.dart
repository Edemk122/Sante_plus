import 'package:sqflite/sqflite.dart';
import '../models/rappel.dart';

class RappelController {
  final Database db;
  RappelController(this.db);

  Future<void> ajouterRappel(Rappel rappel) async {
    await db.insert('rappels', rappel.toMap());
  }

  Future<List<Rappel>> getRappels() async {
    final List<Map<String, dynamic>> maps = await db.query('rappels');
    return List.generate(maps.length, (i) => Rappel.fromMap(maps[i]));
  }

  Future<void> supprimerRappel(int id) async {
    await db.delete('rappels', where: 'id = ?', whereArgs: [id]);
  }
}
