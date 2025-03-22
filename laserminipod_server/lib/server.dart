import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/domain/mail_service.dart';
import 'package:laserminipod_server/src/domain/user_service.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server.
void run(List<String> args) async {
  setupDependencies();

  auth.AuthConfig.set(auth.AuthConfig(
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      var mailService = getIt<MailService>();
      bool success = await mailService.sendEmail(session, userInfo.email!,
          'Reset', 'Der Verifikationscode: $validationCode');
      return Future.value(success);
    },
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
