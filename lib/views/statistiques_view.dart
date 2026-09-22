import 'package:flutter/material.dart';

class StatistiquesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Statistiques Santé")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("📊 Suivi de votre santé",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            // Exemple de jauge simple
            LinearProgressIndicator(
              value: 0.7, // 70% objectif atteint
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 12,
            ),
            SizedBox(height: 10),
            Text("Objectif activité physique : 70%"),

            SizedBox(height: 30),

            // Exemple de carte statistique
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text("Fréquence cardiaque moyenne"),
                subtitle: Text("72 bpm"),
              ),
            ),

            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.local_drink, color: Colors.blue),
                title: Text("Hydratation"),
                subtitle: Text("2.5 L / jour"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
