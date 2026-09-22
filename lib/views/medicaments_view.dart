import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedicamentsView extends StatelessWidget {
  final CollectionReference meds =
      FirebaseFirestore.instance.collection('medicaments');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Médicaments")),
      body: StreamBuilder<QuerySnapshot>(
        stream: meds.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.medication, color: Colors.indigo),
                  title: Text(doc['nom']),
                  subtitle: Text("Dose : ${doc['dose']}"),
                  trailing: Icon(Icons.alarm, color: Colors.orange),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          meds.add({"nom": "Nouveau médicament", "dose": "500mg"});
        },
      ),
    );
  }
}
