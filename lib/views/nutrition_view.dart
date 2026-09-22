import 'package:flutter/material.dart';

class NutritionView extends StatelessWidget {
  final List<String> conseils = [
    "🥗 Manger 5 fruits et légumes par jour",
    "💧 Boire au moins 2L d’eau",
    "🍞 Privilégier les céréales complètes",
    "🥩 Limiter la viande rouge",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conseils Nutrition")),
      body: ListView.builder(
        itemCount: conseils.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.restaurant, color: Colors.green),
              title: Text(conseils[index]),
            ),
          );
        },
      ),
    );
  }
}
