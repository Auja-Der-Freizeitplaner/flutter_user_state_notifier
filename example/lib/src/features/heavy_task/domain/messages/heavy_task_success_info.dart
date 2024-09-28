import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeavyTaskSuccessInfo extends InfoReason {
  HeavyTaskSuccessInfo(this.id);

  final int id;

  @override
  String getDescription(BuildContext context) {
    return AppLocalizations.of(context)!.heavy_task_success_info_description(id);
  }

  @override
  String getCaption(BuildContext context) {
    return AppLocalizations.of(context)!.heavy_task_success_info_caption;
  }
}
