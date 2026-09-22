import 'package:flutter/material.dart';

class PharmacieView extends StatelessWidget {
  final List<Map<String, String>> pharmacies = [
    {
      "nom": "Pharmacie Centrale",
      "adresse": "Rue de Lomé",
      "disponible": "Paracétamol, Vitamine C"
    },
    {
      "nom": "Pharmacie Santé+",
      "adresse": "Quartier Tsévié",
      "disponible": "Ibuprofène, Amoxicilline"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pharmacies & Livraison")),
      body: ListView.builder(
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.local_pharmacy, color: Colors.green),
              title: Text(pharmacies[index]["nom"]!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  "${pharmacies[index]["adresse"]}\nDisponibles : ${pharmacies[index]["disponible"]}"),
              trailing: ElevatedButton(
                child: Text("Commander"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Commande envoyée ✅")),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
