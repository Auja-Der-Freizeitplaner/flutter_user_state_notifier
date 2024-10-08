import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

extension UserStateBuildContextExtension on BuildContext {
  UserStateService get userStateService =>
      UserStateProvider.serviceOf(this, listen: false);
}
