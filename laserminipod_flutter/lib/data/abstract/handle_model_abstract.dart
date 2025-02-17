import 'package:laserminipod_client/laserminipod_client.dart';

abstract class HandleModelAbstract {
  Future<List<Handle>> loadAllHandles();

  Future<void> addHandle(int x, int y, int radius);

  Future<void> editHandle(int id, int x, int y, int radius);

  Future<void> removeHandle(int id);

  Handle? getHandleById(int id);
}
