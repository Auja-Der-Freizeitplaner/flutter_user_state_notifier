import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

abstract class LoadingReason extends Reason {
  bool get isFullScreen => false;

  String getCaption(BuildContext context) {
    return "Loading";
  }

  String getDescription(BuildContext context) {
    return "Please wait";
  }
}

class GenericLoadingReason extends LoadingReason {}
