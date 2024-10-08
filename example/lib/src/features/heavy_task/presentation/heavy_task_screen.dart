import 'package:example/src/features/heavy_task/domain/usecase/heavy_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeavyTaskScreen extends StatelessWidget {
  const HeavyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: HeavyTask(context.userStateService).call,
              child: Text(AppLocalizations.of(context)!.btn_start_heavy_task),
            ),
          ],
        ),
      ),
    );
  }
}
