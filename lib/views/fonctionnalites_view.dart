import 'package:flutter/material.dart';
import 'conseil_view.dart';
import 'rappel_view.dart';
import 'rendezvous_view.dart';
import 'profil_view.dart';
import 'recherche_view.dart';
import 'actualite_view.dart';

class FonctionnalitesView extends StatefulWidget {
  @override
  _FonctionnalitesViewState createState() => _FonctionnalitesViewState();
}

class _FonctionnalitesViewState extends State<FonctionnalitesView> {
  final List<Map<String, dynamic>> features = [
    {
      "icon": Icons.health_and_safety,
      "label": "Conseils santé",
      "category": "Santé",
      "route": (context) => ConseilView(),
    },
    {
      "icon": Icons.location_on,
      "label": "Services proches",
      "category": "Santé",
      "route": (context) => RechercheView(),
    },
    {
      "icon": Icons.alarm,
      "label": "Rappels",
      "category": "Organisation",
      "route": (context) => RappelView(),
    },
    {
      "icon": Icons.calendar_today,
      "label": "Rendez-vous",
      "category": "Organisation",
      "route": (context) => RendezvousView(),
    },
    {
      "icon": Icons.article,
      "label": "Actualité",
      "category": "Infos",
      "route": (context) => ActualiteView(),
    },
    {
      "icon": Icons.person,
      "label": "Profil",
      "category": "Infos",
      "route": (context) => ProfilView(),
    },
  ];

  String query = "";

  // ✅ Icônes personnalisées pour les catégories
  final Map<String, IconData> categoryIcons = {
    "Santé": Icons.favorite,       // cœur
    "Organisation": Icons.event,   // calendrier
    "Infos": Icons.newspaper,      // journal
  };

  @override
  Widget build(BuildContext context) {
    final filteredFeatures = features.where((f) {
      return f["label"].toLowerCase().contains(query.toLowerCase());
    }).toList();

    final categories = filteredFeatures.map((f) => f["category"]).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: Text("Toutes les fonctionnalités")),
      body: Column(
        children: [
          // ✅ Barre de recherche
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Rechercher une fonctionnalité...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() => query = value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final items = filteredFeatures.where((f) => f["category"] == category).toList();

                return ExpansionTile(
                  leading: Icon(categoryIcons[category] ?? Icons.folder, color: Colors.blue),
                  title: Text(
                    category,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  children: items.map((feature) {
                    return ListTile(
                      leading: Icon(feature["icon"], color: Colors.blue),
                      title: Text(feature["label"]),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => feature["route"](context)),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
