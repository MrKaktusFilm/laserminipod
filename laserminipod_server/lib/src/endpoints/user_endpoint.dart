import 'package:serverpod/serverpod.dart';
import '../helpers/user_helper.dart';

class UserEndpoint extends Endpoint {
  /// Changes the password for a user.
  Future<bool> changePassword(
      Session session, String email, String newPassword) async {
    try {
      await UserHelper.changePassword(session, email, newPassword);
      session.log('Password successfully changed for user: $email',
          level: LogLevel.info);
      return true; // Password change successful
    } catch (e, stackTrace) {
      session.log('Error in changePassword: $e\n$stackTrace',
          level: LogLevel.error);
      return false; // Password change failed
    }
  }

  /// Checks if the provided password is correct for a user.
  Future<bool> checkPassword(
      Session session, String email, String password) async {
    try {
      return await UserHelper.checkPassword(session, email, password);
    } catch (e, stackTrace) {
      session.log('Error in checkPassword: $e\n$stackTrace',
          level: LogLevel.error);
      return false; // Password check failed
    }
  }
}
