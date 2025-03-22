import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:user_app/domain/abstract/feedback_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';
import 'package:laserminipod_shared/laserminipod_shared.dart';

class FeedbackController extends ChangeNotifier
    implements FeedbackControllerAbstract {
  static const String feedbackEmailAdress = 'MrKaktusFilm@gmx.de';

  @override
  Future<void> submitFeedback(BuildContext context) async {
    BetterFeedback.of(context).show((UserFeedback feedback) async {
      try {
        await LaserMailer.sendEmail(
            feedbackEmailAdress, 'LaserApp Feedback', feedback.text,
            attachedImage: feedback.screenshot);
      } on Exception catch (e) {
        var loc = UiHelper.getAppLocalization();
        UiHelper.showErrorSnackbar(loc.feedbackError, e);
      }
    });
  }
}
