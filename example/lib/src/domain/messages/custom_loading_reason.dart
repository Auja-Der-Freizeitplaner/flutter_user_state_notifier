import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class CustomLoadingReason extends LoadingReason {
  CustomLoadingReason({required bool isFullScreen})
      : _isFullScreen = isFullScreen;
  final bool _isFullScreen;

  @override
  bool get isFullScreen => _isFullScreen;
  @override
  String getDescription(BuildContext context) {
    return "My Custom Loading popup";
  }
}
