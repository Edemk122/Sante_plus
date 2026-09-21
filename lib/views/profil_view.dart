import 'package:flutter/material.dart';

class ProfilView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text("Nom : Edem",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Âge : 30 ans", style: TextStyle(fontSize: 16)),
                Text("Email : edem@example.com", style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Modifier profil bientôt disponible ✨")),
                    );
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Modifier"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
