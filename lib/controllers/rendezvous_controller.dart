import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/rendezvous.dart';

class RendezvousController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> ajouterRendezvous(Rendezvous rdv) async {
    await _db.collection('rendezvous').add(rdv.toMap());
  }

  Future<List<Rendezvous>> getRendezvous() async {
    var snapshot = await _db.collection('rendezvous').get();
    return snapshot.docs.map((doc) => Rendezvous.fromMap(doc.data(), doc.id)).toList();
  }
}
