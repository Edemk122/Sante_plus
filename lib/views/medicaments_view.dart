import 'package:flutter/material.dart';

class MedicamentsView extends StatelessWidget {
  final List<String> medicaments = [
    "Paracétamol - 500mg",
    "Vitamine C - 1000mg",
    "Ibuprofène - 400mg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Médicaments")),
      body: ListView.builder(
        itemCount: medicaments.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.medication, color: Colors.indigo),
              title: Text(medicaments[index]),
              trailing: Icon(Icons.alarm, color: Colors.orange),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Ajouter un médicament")),
          );
        },
      ),
    );
  }
}
