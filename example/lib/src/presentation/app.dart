import 'package:example/src/domain/messages/custom_info_reason.dart';
import 'package:example/src/domain/messages/custom_loading_reason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserStateListener(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        context.userStateService.setInfo(CustomInfoReason()),
                    child: const Text("Set Info")),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () => context.userStateService.setError(),
                    child: const Text("Set Error")),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () async {
                      final service = context.userStateService;
                      service
                          .setLoading(CustomLoadingReason(isFullScreen: true));
                      await Future.delayed(const Duration(seconds: 4));
                      service.reset();
                    },
                    child: const Text("Set Loading FullScreen")),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () async {
                      final service = context.userStateService;
                      service
                          .setLoading(CustomLoadingReason(isFullScreen: false));
                      await Future.delayed(const Duration(seconds: 4));
                      service.reset();
                    },
                    child: const Text("Set Loading Popup")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
