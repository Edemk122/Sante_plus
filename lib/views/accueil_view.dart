import 'package:flutter/material.dart';
import 'actualite_view.dart';
import 'conseil_view.dart';
import 'fonctionnalites_view.dart';
import 'rappel_view.dart';
import 'rendezvous_view.dart';
import 'profil_view.dart';
import 'recherche_view.dart';

class AccueilView extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      "icon": Icons.health_and_safety,
      "color": Colors.green,
      "label": "Conseils santé",
      "route": (context) => ConseilView(),
    },
    {
      "icon": Icons.location_on,
      "color": Colors.red,
      "label": "Services proches",
      "route": (context) => RechercheView(),
    },
    {
      "icon": Icons.alarm,
      "color": Colors.orange,
      "label": "Rappels",
      "route": (context) => RappelView(),
    },
    {
      "icon": Icons.calendar_today,
      "color": Colors.blue,
      "label": "Rendez-vous",
      "route": (context) => RendezvousView(),
    },
    {
      "icon": Icons.person,
      "color": Colors.purple,
      "label": "Profil",
      "route": (context) => ProfilView(),
    },
    {
      "icon": Icons.article,
      "color": Colors.teal,
      "label": "Actualité",
      "route": (context) => ActualiteView(),
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ AppBar bleu
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.list, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FonctionnalitesView()),
            );
          },
        ),
        title: Text(
          "Santé+",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.lock, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Bouton cadenas cliqué 🔒")),
              );
            },
          ),
        ],
      ),

      // ✅ Body avec fond dégradé et dashboard
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade200, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Message de bienvenue
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "👋 Bienvenue!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // ✅ Dashboard avec icônes arrondies
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2, // responsive
                padding: EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: features.map((feature) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => feature["route"](context)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: feature["color"].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: feature["color"],
                            radius: 30,
                            child: Icon(feature["icon"], color: Colors.white, size: 30),
                          ),
                          SizedBox(height: 10),
                          Text(
                            feature["label"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: feature["color"],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),

      // ✅ Barre des tâches en bas
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.lightBlueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
