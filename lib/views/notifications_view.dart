import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  final List<String> notifications = [
    "Rappel : Rendez-vous demain à 10h",
    "Nouvelle actualité santé disponible",
    "Conseil du jour : boire 2L d’eau",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.notifications_active, color: Colors.red),
              title: Text(notifications[index]),
            ),
          );
        },
      ),
    );
  }
}
