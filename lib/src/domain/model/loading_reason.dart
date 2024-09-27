import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

abstract class LoadingReason extends Reason {
  bool get isFullScreen => false;

  String getCaption(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericLoadingDescription(context);

  String getDescription(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericLoadingDescription(context);
}

class GenericLoadingReason extends LoadingReason {}
