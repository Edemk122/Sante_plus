import 'package:flutter/material.dart';

class AssistanceView extends StatelessWidget {
  final List<String> messages = [
    "Bonjour, j’ai une question sur mon traitement.",
    "Quels sont les effets secondaires du médicament X ?",
    "Comment puis-je améliorer mon sommeil ?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assistance Santé")),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.chat, color: Colors.blueGrey),
              title: Text(messages[index]),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_comment),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Nouvelle question")),
          );
        },
      ),
    );
  }
}
