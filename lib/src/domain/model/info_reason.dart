import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';
import 'package:flutter_user_state_notifier/src/presentation/user_state_provider.dart';

/// Serves as wrapper for arguments in specified info notifications
/// Inherit from this class to generate new Info Notifications which can be used
/// when calling [UserStateService.setInfo()]
abstract class InfoReason extends Reason {
  InfoReason({this.onConfirm});

  // Used to add custom behavior when the notification is being acknowledged
  // Do not call [Navigator.of(context).pop()] here!
  final VoidCallback? onConfirm;

  // Evaluates the text which should be displayed as caption in a info popup
  String getCaption(BuildContext context);

  // Evaluates the text which should be displayed as description in a info popup
  String getDescription(BuildContext context);

  // Evaluates the text which should be displayed as button label in a info popup
  String getButtonLabel(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericButtonLabel(context);
}
