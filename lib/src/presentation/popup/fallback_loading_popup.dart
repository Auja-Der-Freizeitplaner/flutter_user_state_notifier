import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class FallbackLoadingPopup extends StatelessWidget {
  const FallbackLoadingPopup(this.reason, {super.key});

  final LoadingReason reason;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(reason.getCaption(context)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 16),
          Text(reason.getDescription(context))
        ],
      ),
    );
  }
}
