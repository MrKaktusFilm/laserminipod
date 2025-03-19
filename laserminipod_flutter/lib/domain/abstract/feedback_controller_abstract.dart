import 'package:flutter/material.dart';

abstract class FeedbackControllerAbstract extends ChangeNotifier {
  Future<void> submitFeedback(BuildContext context);
}
