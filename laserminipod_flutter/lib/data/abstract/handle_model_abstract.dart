import 'package:laserminipod_client/laserminipod_client.dart';

abstract class HandleModelAbstract {
  Future<List<Handle>> loadAllHandles();

  Future<bool> addHandle(int x, int y, int radius);

  Future<bool> editHandle(int id, int x, int y, int radius);

  Future<bool> removeHandle(int id);
}
