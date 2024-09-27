import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/domain/service/user_state_service.dart';

class UserStateProvider extends InheritedWidget {
  UserStateProvider({
    required super.child,
    required this.buildLoadingScreen,
    required this.buildLoadingPopup,
    required this.buildInfoPopup,
    required this.buildErrorPopup,
    ErrorReason? genericErrorReason,
    LoadingReason? genericLoadingReason,
    super.key,
  }) {
    userState = UserStateService(
      genericErrorReason: genericErrorReason,
      genericLoadingReason: genericLoadingReason,
    );
  }

  late final UserStateService userState;

  final Widget Function(
    BuildContext context,
    LoadingReason reason,
  ) buildLoadingScreen;

  final Widget Function(
    BuildContext context,
    LoadingReason reason,
  ) buildLoadingPopup;

  final Widget Function(
    BuildContext context,
    InfoReason reason,
    VoidCallback onConfirm,
  ) buildInfoPopup;

  final Widget Function(
    BuildContext context,
    ErrorReason reason,
    VoidCallback onConfirm,
  ) buildErrorPopup;

  static UserStateProvider of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<UserStateProvider>()!;

  static UserStateService serviceOf(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<UserStateProvider>()!
          .userState;
    } else {
      return context
          .getInheritedWidgetOfExactType<UserStateProvider>()!
          .userState;
    }
  }

  @override
  bool updateShouldNotify(UserStateProvider oldWidget) {
    return userState != oldWidget.userState;
  }
}
