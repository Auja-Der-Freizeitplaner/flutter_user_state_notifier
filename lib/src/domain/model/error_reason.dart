import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

abstract class ErrorReason extends Reason {
  ErrorReason({this.onConfirm});
  final FutureOr<void> Function()? onConfirm;

  String getCaption(BuildContext context) {
    return 'Error';
  }

  String getDescription(BuildContext context) {
    return 'An unknown Error occurred';
  }

  String getButtonLabel(BuildContext context) {
    return 'Okay';
  }
}

class GenericErrorReason extends ErrorReason {
  GenericErrorReason() : super(onConfirm: null);
}
