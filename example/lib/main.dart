import 'package:example/src/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:example/src/presentation/widget/info_popup.dart';
import 'package:example/src/presentation/widget/loading_popup.dart';
import 'package:example/src/presentation/widget/loading_screen.dart';

void main() {
  runApp(
    UserStateProvider(
      buildErrorPopup: (context, reason, onConfirm) => InfoPopup(
        caption: reason.getCaption(context),
        description: reason.getDescription(context),
        buttonLabel: reason.getButtonLabel(context),
        onConfirm: onConfirm,
      ),
      buildInfoPopup: (context, reason, onConfirm) => InfoPopup(
        caption: reason.getCaption(context),
        description: reason.getDescription(context),
        buttonLabel: reason.getButtonLabel(context),
        onConfirm: onConfirm,
      ),
      buildLoadingPopup: (context, reason) => LoadingPopup(
        caption: reason.getCaption(context),
        description: reason.getDescription(context),
      ),
      buildLoadingScreen: (context, reason) => LoadingScreen(
        caption: reason.getCaption(context),
        description: reason.getDescription(context),
      ),
      child: const MainApp(),
    ),
  );
}
