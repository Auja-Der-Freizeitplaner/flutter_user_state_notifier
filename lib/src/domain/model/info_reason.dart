import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';
import 'package:flutter_user_state_notifier/src/presentation/user_state_provider.dart';

abstract class InfoReason extends Reason {
  InfoReason({this.onConfirm});
  final VoidCallback? onConfirm;

  String getCaption(BuildContext context);

  String getDescription(BuildContext context);

  String getButtonLabel(BuildContext context) =>
      UserStateProvider.of(context).onGenerateGenericButtonLabel(context);
}
