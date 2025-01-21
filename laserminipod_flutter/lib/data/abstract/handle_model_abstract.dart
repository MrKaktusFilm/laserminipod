import 'package:laserminipod_client/laserminipod_client.dart';

abstract class HandleModelAbstract {
  Future<List<Handle>> loadAllHandles();
}
