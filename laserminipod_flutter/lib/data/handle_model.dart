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
}
