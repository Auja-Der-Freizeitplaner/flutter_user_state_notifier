import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

abstract class ErrorReason extends Reason {
  ErrorReason({this.onConfirm});
  final VoidCallback? onConfirm;

  String getCaption(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericErrorCaption(context);

  String getDescription(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericErrorDescription(context);

  String getButtonLabel(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericButtonLabel(context);
}

class GenericErrorReason extends ErrorReason {
  GenericErrorReason() : super(onConfirm: null);
}
