import 'package:example/src/core/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    UserStateProvider(
      onGenerateGenericButtonLabel: (context) =>
          AppLocalizations.of(context)!.btn_okay,
      onGenerateGenericErrorCaption: (context) =>
          AppLocalizations.of(context)!.generic_error_caption,
      onGenerateGenericErrorDescription: (context) =>
          AppLocalizations.of(context)!.generic_error_description,
      onGenerateGenericLoadingCaption: (context) =>
          AppLocalizations.of(context)!.generic_loading_caption,
      onGenerateGenericLoadingDescription: (context) =>
          AppLocalizations.of(context)!.generic_loading_description,
      child: const App(),
    ),
  );
}
