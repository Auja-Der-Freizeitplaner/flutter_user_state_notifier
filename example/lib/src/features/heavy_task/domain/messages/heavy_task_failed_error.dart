import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeavyTaskFailedError extends ErrorReason {
  HeavyTaskFailedError({super.onConfirm});

  @override
  String getDescription(BuildContext context) {
    return AppLocalizations.of(context)!.heavy_task_success_error_description;
  }

  @override
  String getButtonLabel(BuildContext context) {
    return AppLocalizations.of(context)!.btn_retry;
  }
}
