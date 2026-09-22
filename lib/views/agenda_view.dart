import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgendaView extends StatelessWidget {
  final CollectionReference agenda =
      FirebaseFirestore.instance.collection('agenda');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agenda Santé")),
      body: StreamBuilder<QuerySnapshot>(
        stream: agenda.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.event_note, color: Colors.deepOrange),
                  title: Text(doc['titre']),
                  subtitle: Text("Date : ${doc['date']}"),
                  trailing: Icon(Icons.notifications, color: Colors.blue),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          agenda.add({"titre": "Nouveau rendez-vous", "date": "01/10/2026"});
        },
      ),
    );
  }
}
