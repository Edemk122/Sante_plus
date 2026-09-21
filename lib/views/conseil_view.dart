import 'package:flutter/material.dart';
import '../controllers/conseil_controller.dart';
import '../models/conseil.dart';

class ConseilView extends StatefulWidget {
  @override
  _ConseilViewState createState() => _ConseilViewState();
}

class _ConseilViewState extends State<ConseilView> {
  final controller = ConseilController();
  List<Conseil> conseils = [];

  @override
  void initState() {
    super.initState();
    controller.getConseils().then((data) {
      setState(() => conseils = data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conseils Santé")),
      body: ListView.builder(
        itemCount: conseils.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(conseils[index].titre),
            subtitle: Text(conseils[index].description),
          );
        },
      ),
    );
  }
}
