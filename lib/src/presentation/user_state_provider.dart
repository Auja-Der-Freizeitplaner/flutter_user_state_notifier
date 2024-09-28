import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/domain/service/user_state_service.dart';

class UserStateProvider extends InheritedWidget {
  UserStateProvider({
    required super.child,
    this.onBuildLoadingScreen,
    this.onBuildLoadingPopup,
    this.onBuildInfoPopup,
    this.onBuildErrorPopup,
    required this.onGenerateGenericLoadingCaption,
    required this.onGenerateGenericLoadingDescription,
    required this.onGenerateGenericErrorCaption,
    required this.onGenerateGenericErrorDescription,
    required this.onGenerateGenericButtonLabel,
    super.key,
  }) : userState = UserStateService();

  final UserStateService userState;

  final Widget Function(
    LoadingReason reason,
  )? onBuildLoadingScreen;

  final Widget Function(
    LoadingReason reason,
  )? onBuildLoadingPopup;

  final Widget Function(
    InfoReason reason,
    VoidCallback onConfirm,
  )? onBuildInfoPopup;

  final Widget Function(
    ErrorReason reason,
    VoidCallback onConfirm,
  )? onBuildErrorPopup;

  final String Function(BuildContext context) onGenerateGenericLoadingCaption;
  final String Function(BuildContext context)
      onGenerateGenericLoadingDescription;
  final String Function(BuildContext context) onGenerateGenericErrorCaption;
  final String Function(BuildContext context) onGenerateGenericErrorDescription;
  final String Function(BuildContext context) onGenerateGenericButtonLabel;

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
