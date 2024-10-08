import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

/// Serves as wrapper for arguments in specified error notifications
/// Inherit from this class to generate new Error Notifications which can be used
/// when calling [UserStateService.setError()]
abstract class ErrorReason extends Reason {
  ErrorReason({this.onConfirm});

  // Used to add custom behavior when the notification is being acknowledged
  // Do not call [Navigator.of(context).pop()] here!
  final VoidCallback? onConfirm;

  // Evaluates the text which should be displayed as caption in a error popup
  String getCaption(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericErrorCaption(context);

  // Evaluates the text which should be displayed as description in a error popup
  String getDescription(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericErrorDescription(context);

  // Evaluates the text which should be displayed as button label in a error popup
  String getButtonLabel(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericButtonLabel(context);
}

class GenericErrorReason extends ErrorReason {
  GenericErrorReason() : super(onConfirm: null);
}
