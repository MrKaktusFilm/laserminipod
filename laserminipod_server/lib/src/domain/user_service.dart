import 'package:laserminipod_server/src/data/user_repository.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<void> createUser(
      Session session, String email, String password) async {
    try {
      var existingUser = await _userRepository.getUserByEmail(session, email);
      if (existingUser != null) {
        session.log('User already exists: $email', level: LogLevel.warning);
        return;
      }

      var hashedPassword = await auth.defaultGeneratePasswordHash(password);
      var newUser =
          await _userRepository.createUser(session, email, hashedPassword);
      if (newUser != null) {
        session.log('User created successfully: $email', level: LogLevel.info);
      } else {
        session.log('User creation failed: $email', level: LogLevel.error);
      }
    } catch (e, stackTrace) {
      session.log('Error creating user: $e\n$stackTrace',
          level: LogLevel.error);
    }
  }

  Future<void> changePassword(
      Session session, String email, String newPassword) async {
    try {
      var user = await _userRepository.getUserByEmail(session, email);
      if (user == null) {
        session.log('User not found: $email', level: LogLevel.warning);
        return;
      }

      var newHashedPassword =
          await auth.defaultGeneratePasswordHash(newPassword);
      await _userRepository.updatePasswordHash(
          session, email, newHashedPassword);
      session.log('Password successfully changed for: $email',
          level: LogLevel.info);
    } catch (e, stackTrace) {
      session.log('Error changing password: $e\n$stackTrace',
          level: LogLevel.error);
    }
  }

  Future<bool> checkPassword(
      Session session, String email, String password) async {
    try {
      var user = await _userRepository.getUserByEmail(session, email);
      if (user == null) {
        session.log('User not found: $email', level: LogLevel.warning);
        return false;
      }

      return await auth.defaultValidatePasswordHash(password, email, user.hash);
    } catch (e, stackTrace) {
      session.log('Error checking password: $e\n$stackTrace',
          level: LogLevel.error);
      return false;
    }
  }
}
