import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod/serverpod.dart';

class MailService {
  final String password = "!)#K46n'T^8g=W2";
  final String adress = 'laserprojekt.test@gmx.de';
  final String name = 'LaserProjekt noreply';

  Future<bool> sendEmail(
      Session session, String recipient, String subject, String body) async {
    final smtpServer = SmtpServer('mail.gmx.net',
        password: password, username: adress, port: 587, ssl: false);

    final message = Message()
      ..from = Address(adress, name)
      ..recipients.add(recipient)
      ..subject = subject
      ..text = body;

    try {
      await send(message, smtpServer);
      session.log('Sent validation code mail to $recipient');

      return true;
    } catch (e, stacktrace) {
      session.log('Email send failed:',
          exception: e, stackTrace: stacktrace, level: LogLevel.error);
      return false;
    }
  }
}
