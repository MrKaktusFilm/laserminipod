import 'dart:typed_data';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class LaserMailer {
  static final String password = "!)#K46n'T^8g=W2";
  static final String adress = 'laserprojekt.test@gmx.de';
  static final String name = 'LaserProjekt noreply';

  /// sends an mail to the recipient from the configured address
  static Future<bool> sendEmail(String recipient, String subject, String body,
      {Uint8List? attachedImage}) async {
    final smtpServer = SmtpServer('mail.gmx.net',
        password: password, username: adress, port: 587, ssl: false);
    final message = Message()
      ..from = Address(adress, name)
      ..recipients.add(recipient)
      ..subject = subject
      ..text = body;

    if (attachedImage != null) {
      var attachment = StreamAttachment(
        Stream.value(attachedImage),
        'image/png',
        fileName: 'pic.png',
      );
      message.attachments.add(attachment);
    }

    try {
      await send(message, smtpServer);

      return true;
    } catch (e) {
      return false;
    }
  }
}
