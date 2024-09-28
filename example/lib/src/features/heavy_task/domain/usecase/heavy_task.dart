import 'dart:math';

import 'package:example/src/features/heavy_task/domain/messages/heavy_task_failed_error.dart';
import 'package:example/src/features/heavy_task/domain/messages/heavy_task_success_info.dart';
import 'package:example/src/features/heavy_task/domain/messages/heavy_task_loading.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class HeavyTask {
  const HeavyTask(this.notifier);
  final UserStateService notifier;

  Future<void> call() async {
    notifier.setLoading(HeavyTaskLoading(isFullScreen: false));
    await Future.delayed(const Duration(seconds: 2));
    final success = Random().nextBool();
    if (success) {
      final id = Random().nextInt(1024);
      notifier.setInfo(HeavyTaskSuccessInfo(id));
    } else {
      notifier.setError(HeavyTaskFailedError(onConfirm: call));
    }
  }
}
