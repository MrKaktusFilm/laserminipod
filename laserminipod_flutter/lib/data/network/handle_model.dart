import 'package:laserminipod_client/src/protocol/client.dart';
import 'package:laserminipod_client/src/protocol/handle.dart';
import 'package:user_app/data/network/abstract/handle_model_abstract.dart';

class HandleModel extends HandleModelAbstract {
  late EndpointHandle handleEndpoint;
  List<Handle>? _handleCache;

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
  Future<void> addHandle(int x, int y, int radius) async {
    try {
      int id = await handleEndpoint.addHandle(x, y, radius);
      _handleCache?.add(Handle(id: id, x: x, y: y, radius: radius));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editHandle(int id, int x, int y, int radius) async {
    try {
      await handleEndpoint.editHandle(id, x, y, radius);
      var index = _handleCache?.indexWhere((handle) => handle.id == id);
      if (index != null && index >= 0) {
        _handleCache?[index] = Handle(id: id, x: x, y: y, radius: radius);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeHandle(int id) async {
    try {
      await handleEndpoint.removeHandle(id);
      _handleCache?.removeWhere((handle) => handle.id == id);
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

  @override
  void initialize(Client client) {
    handleEndpoint = client.handle;
  }
}
