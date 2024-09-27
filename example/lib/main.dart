import 'package:example/src/presentation/app.dart';
import 'package:example/src/presentation/widget/error_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:example/src/presentation/widget/info_popup.dart';
import 'package:example/src/presentation/widget/loading_popup.dart';
import 'package:example/src/presentation/widget/loading_screen.dart';

void main() {
  runApp(
    UserStateProvider(
      onBuildErrorPopup: ErrorPopup.new,
      onBuildInfoPopup: InfoPopup.new,
      onBuildLoadingPopup: LoadingPopup.new,
      onBuildLoadingScreen: LoadingScreen.new,
      onGenerateGenericButtonLabel: (context) => "Okay",
      onGenerateGenericErrorCaption: (context) => "Error",
      onGenerateGenericErrorDescription: (context) => "Something went wrong",
      onGenerateGenericLoadingCaption: (context) => "Loading",
      onGenerateGenericLoadingDescription: (context) => "Please wait",
      child: const App(),
    ),
  );
}
