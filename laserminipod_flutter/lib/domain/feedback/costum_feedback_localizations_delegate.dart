import 'dart:ui';

import 'package:feedback/feedback.dart';
import 'package:user_app/domain/feedback/costum_feedback_localizations.dart';

class CostumFeedbackLocalizationsDelegate
    extends GlobalFeedbackLocalizationsDelegate {
  @override
  Map<Locale, FeedbackLocalizations> get supportedLocales =>
      <Locale, FeedbackLocalizations>{
        // remember to change the locale identifier
        // as well as that defaultLocale (defaults to en) should ALWAYS be
        // present here or overridden
        const Locale('en'): CostumFeedbackLocalizations(),
      };
}
