import 'package:flutter/material.dart';
import 'agenda_view.dart';
import 'assistance_view.dart';
import 'conseil_view.dart';
import 'medicaments_view.dart';
import 'nutrition_view.dart';
import 'pharmacie_map_view.dart';
import 'pharmacie_view.dart';
import 'rappel_view.dart';
import 'rendezvous_view.dart';
import 'profil_view.dart';
import 'recherche_view.dart';
import 'actualite_view.dart';
import 'fonctionnalites_view.dart';
import 'notifications_view.dart';

class AccueilView extends StatefulWidget {
  @override
  _AccueilViewState createState() => _AccueilViewState();
}

class _AccueilViewState extends State<AccueilView> {
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
      "icon": Icons.article,
      "color": Colors.teal,
      "label": "Actualité",
      "route": (context) => ActualiteView(),
    },
    {
      "icon": Icons.person,
      "color": Colors.purple,
      "label": "Profil",
      "route": (context) => ProfilView(),
    },
    {
      "icon": Icons.local_pharmacy,
      "color": Colors.green,
      "label": "Pharmacies",
      "route": (context) => PharmacieView(),
    },
    {
      "icon": Icons.map,
      "color": Colors.teal,
      "label": "Carte Pharmacies",
      "route": (context) => PharmacieMapView(),
    },
    {
      "icon": Icons.medication,
      "color": Colors.indigo,
      "label": "Médicaments",
      "route": (context) => MedicamentsView(),
    },
    {
      "icon": Icons.event_note,
      "color": Colors.deepOrange,
      "label": "Agenda Santé",
      "route": (context) => AgendaView(),
    },
    {
      "icon": Icons.restaurant,
      "color": Colors.green,
      "label": "Nutrition",
      "route": (context) => NutritionView(),
    },
    {
      "icon": Icons.chat,
      "color": Colors.blueGrey,
      "label": "Assistance",
      "route": (context) => AssistanceView(),
    },

  ];

  int unreadCount = 3; // ✅ exemple de notifications non lues
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    // ✅ Timer pour défilement automatique
    Future.delayed(Duration(seconds: 3), _autoScroll);
  }

  void _autoScroll() {
    if (!_pageController.hasClients) return;
    int nextPage = _pageController.page!.toInt() + 1;
    if (nextPage >= 3) nextPage = 0; // boucle sur 3 pubs
    _pageController.animateToPage(
      nextPage,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    Future.delayed(Duration(seconds: 3), _autoScroll); // relance
  }

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

      // ✅ Body avec fond dégradé, dashboard minimaliste et pub
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
                "Bienvenue!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // ✅ Dashboard minimaliste
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 4,
                padding: EdgeInsets.all(8),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: features.map((feature) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => feature["route"](context)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(feature["icon"], color: feature["color"], size: 40),
                        SizedBox(height: 6),
                        Text(
                          feature["label"],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: feature["color"],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            // ✅ Espace pub défilant avec PageView
            SizedBox(height: 120, child: _pubCarousel()),
          ],
        ),
      ),

      // ✅ Barre des tâches en bas avec badge notifications
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.lightBlueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => NotificationsView()),
            );
          }
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.notifications),
                if (unreadCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$unreadCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: "Notifications",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  // ✅ Carrousel pub avec PageView
  Widget _pubCarousel() {
    final List<String> pubImages = [
      "assets/pub1.jpg",
      "assets/pub2.jpg",
      "assets/pub3.jpg",
    ];

    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      reverse: true, // ✅ défilement de droite vers gauche
      itemCount: pubImages.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(pubImages[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
