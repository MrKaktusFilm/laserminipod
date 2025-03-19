import 'dart:io';
import 'dart:typed_data';

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_app/domain/abstract/feedback_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class FeedbackController extends ChangeNotifier
    implements FeedbackControllerAbstract {
  static const String feedbackEmailAdress = 'MrKaktusFilm@gmx.de';

  @override
  Future<void> submitFeedback(BuildContext context) async {
    BetterFeedback.of(context).show((UserFeedback feedback) async {
      try {
        final screenshotFilePath =
            await _writeImageToStorage(feedback.screenshot);

        final Email email = Email(
          body: feedback.text,
          subject: 'LaserApp Feedback',
          recipients: [feedbackEmailAdress],
          attachmentPaths: [screenshotFilePath],
          isHTML: false,
        );
        await FlutterEmailSender.send(email);
      } on Exception catch (e) {
        var loc = UiHelper.getAppLocalization();
        UiHelper.showErrorSnackbar(loc.feedbackError, e);
      }
    });
  }

  Future<String> _writeImageToStorage(Uint8List feedbackScreenshot) async {
    final directory = await getTemporaryDirectory();
    final String screenshotFilePath = '${directory.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }
}
