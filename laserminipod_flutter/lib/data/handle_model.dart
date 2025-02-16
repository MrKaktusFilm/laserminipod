import 'package:laserminipod_client/src/protocol/handle.dart';
import 'package:user_app/data/abstract/handle_model_abstract.dart';
import 'package:user_app/main.dart';

class HandleModel extends HandleModelAbstract {
  var handleEndpoint = client.handle;
  List<Handle>? _handleCache;

  HandleModel() {
    _refresh();
  }

  Future<void> _refresh() async {
    try {
      _handleCache = await handleEndpoint.loadAllHandles();
    } catch (e) {
      _handleCache = [];
      rethrow;
    }
  }

  @override
  Future<List<Handle>> loadAllHandles() async {
    try {
      if (_handleCache == null || _handleCache!.isEmpty) {
        await _refresh();
      }
    } on Exception {
      rethrow;
    }
    return _handleCache ?? [];
  }

  @override
  Future<bool> addHandle(int x, int y, int radius) async {
    try {
      final result = await handleEndpoint.addHandle(x, y, radius);
      if (result) {
        // Refresh the cache
        await _refresh();
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> editHandle(int id, int x, int y, int radius) async {
    try {
      final result = await handleEndpoint.editHandle(id, x, y, radius);
      if (result) {
        // Refresh the cache
        await _refresh();
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeHandle(int id) async {
    try {
      final result = await handleEndpoint.removeHandle(id);
      if (result) {
        // Refresh the cache
        await _refresh();
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  /// Retrieves a specific handle by ID from the cache.
  Handle? getHandleById(int id) {
    if (_handleCache == null) {
      print('Handles not initialized yet. Returning null.');
      return null;
    }
    return _handleCache?.firstWhere((handle) => handle.id == id);
  }
}
