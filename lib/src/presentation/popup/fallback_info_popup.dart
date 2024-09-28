import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/presentation/popup/layout/cupertino_popup.dart';
import 'package:flutter_user_state_notifier/src/presentation/popup/layout/material_popup.dart';

class FallbackInfoPopup extends StatelessWidget {
  const FallbackInfoPopup(this.reason, this.onConfirm, {super.key});

  final InfoReason reason;
  final Future<void> Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS //
        ? CupertinoPopup(
            caption: reason.getCaption(context),
            description: reason.getDescription(context),
            buttonLabel: reason.getButtonLabel(context),
            onTap: onConfirm,
          )
        : MaterialPopup(
            caption: reason.getCaption(context),
            description: reason.getDescription(context),
            buttonLabel: reason.getButtonLabel(context),
            onTap: onConfirm,
          );
  }
}
