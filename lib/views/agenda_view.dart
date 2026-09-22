import 'package:flutter/material.dart';

class AgendaView extends StatelessWidget {
  final List<Map<String, String>> rendezvous = [
    {"date": "25/09/2026", "titre": "Consultation générale"},
    {"date": "28/09/2026", "titre": "Analyse sanguine"},
    {"date": "02/10/2026", "titre": "Dentiste"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agenda Santé")),
      body: ListView.builder(
        itemCount: rendezvous.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.event_note, color: Colors.deepOrange),
              title: Text(rendezvous[index]["titre"]!),
              subtitle: Text("Date : ${rendezvous[index]["date"]}"),
              trailing: Icon(Icons.notifications, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
