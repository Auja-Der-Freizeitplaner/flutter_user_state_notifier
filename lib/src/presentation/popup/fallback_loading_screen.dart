import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class FallbackLoadingScreen extends StatelessWidget {
  const FallbackLoadingScreen(this.reason, {super.key});

  final LoadingReason reason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              reason.getCaption(context),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(reason.getDescription(context)),
            const SizedBox(height: 16),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
