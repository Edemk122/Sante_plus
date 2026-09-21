import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/service.dart';

class ServiceController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Service>> getServices() async {
    var snapshot = await _db.collection('services').get();
    return snapshot.docs.map((doc) => Service.fromMap(doc.data(), doc.id)).toList();
  }
}
