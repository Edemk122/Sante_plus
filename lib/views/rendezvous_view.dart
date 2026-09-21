import 'package:flutter/material.dart';
import '../controllers/rendezvous_controller.dart';
import '../models/rendezvous.dart';

class RendezvousView extends StatefulWidget {
  @override
  _RendezvousViewState createState() => _RendezvousViewState();
}

class _RendezvousViewState extends State<RendezvousView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _centreController = TextEditingController();
  DateTime? _selectedDate;
  final RendezvousController controller = RendezvousController();
  List<Rendezvous> rendezvousList = [];

  @override
  void initState() {
    super.initState();
    _loadRendezvous();
  }

  Future<void> _loadRendezvous() async {
    final data = await controller.getRendezvous();
    setState(() => rendezvousList = data);
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      final rdv = Rendezvous(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        centre: _centreController.text,
        date: _selectedDate!,
      );
      await controller.ajouterRendezvous(rdv);
      _centreController.clear();
      setState(() => _selectedDate = null);
      _loadRendezvous();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Rendez-vous enregistré ✅")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prendre Rendez-vous")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _centreController,
                    decoration: InputDecoration(labelText: "Centre de santé"),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Veuillez entrer le centre" : null,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(_selectedDate == null
                          ? "Aucune date choisie"
                          : "Date : ${_selectedDate!.toLocal()}".split(' ')[0]),
                      Spacer(),
                      ElevatedButton(
                        onPressed: _pickDate,
                        child: Text("Choisir une date"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text("Enregistrer le RDV"),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: rendezvousList.length,
                itemBuilder: (context, index) {
                  final rdv = rendezvousList[index];
                  return ListTile(
                    title: Text(rdv.centre),
                    subtitle: Text("Date : ${rdv.date.toLocal()}".split(' ')[0]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
