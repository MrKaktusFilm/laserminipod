import 'package:feedback/feedback.dart';
import 'package:user_app/domain/ui_helper.dart';

class CostumFeedbackLocalizations implements FeedbackLocalizations {
  @override
  String get draw {
    var loc = UiHelper.getAppLocalizationNullSafe();
    return loc != null ? loc.draw : 'Draw';
  }

  @override
  String get feedbackDescriptionText {
    var loc = UiHelper.getAppLocalizationNullSafe();
    return loc != null ? loc.feedbackDescription : "What's wrong?";
  }

  @override
  String get navigate {
    var loc = UiHelper.getAppLocalizationNullSafe();
    return loc != null ? loc.navigate : 'Navigate';
  }

  @override
  String get submitButtonText {
    var loc = UiHelper.getAppLocalizationNullSafe();
    return loc != null ? loc.submit : 'Submit';
  }
}
