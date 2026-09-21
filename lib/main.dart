import 'package:flutter/material.dart';
import 'views/accueil_view.dart';

void main() {
  runApp(SantePlusApp());
}

class SantePlusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santé+',
      theme: ThemeData(primarySwatch: Colors.green),
      home: AccueilView(),
    );
  }
}
