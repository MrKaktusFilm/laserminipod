import 'package:laserminipod_server/src/generated/spraywall_name.dart';
import 'package:serverpod/serverpod.dart';

class SpraywallNameRepository {
  static const int id = 1;

  Future<void> setName(Session session, String name) async {
    var nameRow = await SpraywallName.db.findById(session, id);
    if (nameRow == null) {
      nameRow = SpraywallName(id: id, name: name);
      await SpraywallName.db.insertRow(session, nameRow);
    } else {
      nameRow.name = name;
      await SpraywallName.db.updateRow(session, nameRow);
    }
  }

  Future<String?> getName(Session session) async {
    var nameRow = await SpraywallName.db.findById(session, id);
    return nameRow?.name;
  }
}
