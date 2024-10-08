import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeavyTaskLoading extends LoadingReason {
  HeavyTaskLoading({required bool isFullScreen})
      : _isFullScreen = isFullScreen;
  final bool _isFullScreen;

  @override
  bool get isFullScreen => _isFullScreen;
  @override
  String getDescription(BuildContext context) {
    return AppLocalizations.of(context)!.generic_loading_description;
  }
}
