import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

abstract class InfoReason extends Reason {
  InfoReason({this.onConfirm});
  final FutureOr<void> Function()? onConfirm;

  String getCaption(BuildContext context) {
    return 'Info';
  }

  String getDescription(BuildContext context);

  String getButtonLabel(BuildContext context) {
    return 'Okay';
  }
}
