import 'package:laserminipod_client/src/protocol/handle.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/main.dart';

class HandleModel extends HandleModelAbstract {
  var handleEndpoint = client.handle;
  @override
  Future<List<Handle>> loadAllHandles() async {
    try {
      return await handleEndpoint.loadAllHandles();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addHandle(int x, int y, int radius) async {
    try {
      return await handleEndpoint.addHandle(x, y, radius);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> editHandle(int id, int x, int y, int radius) async {
    try {
      return await handleEndpoint.editHandle(id, x, y, radius);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeHandle(int id) async {
    try {
      return await handleEndpoint.removeHandle(id);
    } catch (e) {
      rethrow;
    }
  }
}
