import 'package:example/src/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

void main() {
  runApp(
    UserStateProvider(
      onGenerateGenericButtonLabel: (context) => "Okay",
      onGenerateGenericErrorCaption: (context) => "Error",
      onGenerateGenericErrorDescription: (context) => "Something went wrong",
      onGenerateGenericLoadingCaption: (context) => "Loading",
      onGenerateGenericLoadingDescription: (context) => "Please wait",
      child: const App(),
    ),
  );
}
