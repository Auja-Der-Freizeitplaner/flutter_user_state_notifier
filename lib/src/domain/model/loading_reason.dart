import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

abstract class LoadingReason extends Reason {
  
  // Defines wether the loading overlay should be displayed as popup or as full screen
  bool get isFullScreen => false;

  // Evaluates the text which should be displayed as caption in a loading popup/screen
  String getCaption(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericLoadingCaption(context);

  // Evaluates the text which should be displayed as description in a loading popup/screen
  String getDescription(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericLoadingDescription(context);
}

class GenericLoadingReason extends LoadingReason {}
