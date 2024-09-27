import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class CustomLoadingReason extends LoadingReason {
  @override
  bool get isFullScreen => true;
  @override
  String getDescription(BuildContext context) {
    return "My Custom Loading popup";
  }
}
