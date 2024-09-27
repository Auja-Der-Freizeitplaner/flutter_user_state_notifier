import 'package:example/src/presentation/widget/popup_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class ErrorPopup extends StatelessWidget {
  const ErrorPopup(this.reason, this.onConfirm, {super.key});

  final ErrorReason reason;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return PopupLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            reason.getCaption(context),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(reason.getDescription(context)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onConfirm,
            child: Text(reason.getButtonLabel(context)),
          )
        ],
      ),
    );
  }
}
