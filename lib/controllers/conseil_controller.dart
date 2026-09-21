import '../models/conseil.dart';

class ConseilController {
  Future<List<Conseil>> getConseils() async {
    return [
      Conseil(id: "1", titre: "Hygiène", description: "Lavez-vous les mains régulièrement."),
      Conseil(id: "2", titre: "Nutrition", description: "Mangez équilibré et évitez les excès."),
    ];
  }
}
