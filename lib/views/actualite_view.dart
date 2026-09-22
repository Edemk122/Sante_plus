import 'package:flutter/material.dart';

class ActualiteView extends StatelessWidget {
  final List<Map<String, String>> actualites = const [
    {
      "titre": "Campagne de vaccination",
      "contenu": "Une nouvelle campagne démarre cette semaine."
    },
    {
      "titre": "Hygiène alimentaire",
      "contenu": "Conseils pour éviter les intoxications."
    },
    {
      "titre": "Prévention Covid-19",
      "contenu": "Rappel des gestes barrières essentiels."
    },
  ];

  const ActualiteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Actualités Santé")),
      body: ListView.builder(
        itemCount: actualites.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.article, color: Colors.teal),
              title: Text(
                actualites[index]["titre"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(actualites[index]["contenu"]!),
            ),
          );
        },
      ),
    );
  }
}
