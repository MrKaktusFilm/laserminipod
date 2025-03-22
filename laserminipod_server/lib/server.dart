import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/user_service.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:laserminipod_shared/laserminipod_shared.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server.
void run(List<String> args) async {
  setupDependencies();

  auth.AuthConfig.set(auth.AuthConfig(
    sendPasswordResetEmail: _sendPasswordResetMail,
  ));

  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // Start the server.
  await pod.start();

  // Initialize the user service.
  init(pod);
}

void init(Serverpod pod) {
  final userService = getIt<UserService>();
  userService.initialize(pod);
}

Future<bool> _sendPasswordResetMail(
    Session session, auth.UserInfo userInfo, String validationCode) async {
  bool success = false;
  // TODO: internationalisieren
  try {
    success = await LaserMailer.sendEmail(
        userInfo.email!, 'Reset', 'Der Verifikationscode: $validationCode');
  } on Exception catch (e, stacktrace) {
    session.log('Sending validation code to ${userInfo.email} failed:',
        exception: e, stackTrace: stacktrace, level: LogLevel.error);
  }
  if (success) {
    session.log('Sent validation code mail to ${userInfo.email}');
  } else {
    session.log('Sending validation code to ${userInfo.email} failed',
        level: LogLevel.error);
  }
  return success;
}
