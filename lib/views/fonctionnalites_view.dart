import 'package:flutter/material.dart';
import 'conseil_view.dart';
import 'rappel_view.dart';
import 'rendezvous_view.dart';
import 'profil_view.dart';
import 'recherche_view.dart';
import 'actualite_view.dart';

class FonctionnalitesView extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      "icon": Icons.health_and_safety,
      "label": "Conseils santé",
      "route": (context) => ConseilView(),
    },
    {
      "icon": Icons.location_on,
      "label": "Services proches",
      "route": (context) => RechercheView(),
    },
    {
      "icon": Icons.alarm,
      "label": "Rappels",
      "route": (context) => RappelView(),
    },
    {
      "icon": Icons.calendar_today,
      "label": "Rendez-vous",
      "route": (context) => RendezvousView(),
    },
    {
      "icon": Icons.article,
      "label": "Actualité",
      "route": (context) => ActualiteView(),
    },
    {
      "icon": Icons.person,
      "label": "Profil",
      "route": (context) => ProfilView(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toutes les fonctionnalités")),
      body: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(feature["icon"], color: Colors.blue),
              title: Text(feature["label"]),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => feature["route"](context)),
              ),
            ),
          );
        },
      ),
    );
  }
}
