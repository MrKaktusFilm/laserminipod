import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserImageRepository {
  Future<String?> getImageUrl(Session session, int userId) async {
    var userImage = await UserImage.db.findFirstRow(
      session,
      where: (p0) => p0.userId.equals(userId),
    );
    return userImage?.url;
  }
}
