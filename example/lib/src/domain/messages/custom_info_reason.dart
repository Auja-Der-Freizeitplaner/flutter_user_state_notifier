import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class CustomInfoReason extends InfoReason {
  @override
  String getDescription(BuildContext context) {
    return "My Custom Info popup";
  }

  @override
  String getCaption(BuildContext context) {
    return "Info";
  }
}
