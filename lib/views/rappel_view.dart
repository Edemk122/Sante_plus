import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../controllers/rappel_controller.dart';
import '../models/rappel.dart';

class RappelView extends StatefulWidget {
  @override
  _RappelViewState createState() => _RappelViewState();
}

class _RappelViewState extends State<RappelView> {
  late RappelController controller;
  List<Rappel> rappels = [];

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  Future<void> _initDb() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'rappels.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE rappels(id INTEGER PRIMARY KEY, titre TEXT, date TEXT)",
        );
      },
      version: 1,
    );
    controller = RappelController(db);
    _loadRappels();
  }

  Future<void> _loadRappels() async {
    final data = await controller.getRappels();
    setState(() => rappels = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes Rappels")),
      body: ListView.builder(
        itemCount: rappels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(rappels[index].titre),
            subtitle: Text(rappels[index].date.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final rappel = Rappel(
            id: DateTime.now().millisecondsSinceEpoch,
            titre: "Prendre médicament",
            date: DateTime.now().add(Duration(hours: 2)),
          );
          await controller.ajouterRappel(rappel);
          _loadRappels();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
