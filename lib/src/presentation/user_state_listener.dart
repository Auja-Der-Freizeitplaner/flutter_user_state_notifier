import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';
import 'package:flutter_user_state_notifier/src/presentation/popup/fallback_error_popup.dart';
import 'package:flutter_user_state_notifier/src/presentation/popup/fallback_info_popup.dart';
import 'package:flutter_user_state_notifier/src/presentation/popup/fallback_loading_popup.dart';
import 'package:flutter_user_state_notifier/src/presentation/popup/fallback_loading_screen.dart';

class UserStateListener extends StatefulWidget {
  const UserStateListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<UserStateListener> createState() => _UserStateListenerState();
}

class _UserStateListenerState extends State<UserStateListener> {
  late final _userStateService = context.userStateService;

  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((_) => _notifyUser());
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _userStateService.addListener(_notifyUser);
    super.initState();
  }

  @override
  void dispose() {
    _userStateService.removeListener(_notifyUser);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _userStateService,
      builder: (context, child) {
        late final LoadingReason? loadingReason;
        if (_userStateService.reason case final LoadingReason reason) {
          loadingReason = reason;
        } else {
          loadingReason = null;
        }

        return Stack(
          children: [
            widget.child,
            if (loadingReason != null)
              loadingReason.isFullScreen
                  ? UserStateProvider.of(context).onBuildLoadingScreen?.call(
                            loadingReason,
                          ) ??
                      FallbackLoadingScreen(loadingReason)
                  : ColoredBox(
                      color: Colors.black.withOpacity(.3),
                      child: UserStateProvider.of(context)
                              .onBuildLoadingPopup
                              ?.call(
                                loadingReason,
                              ) ??
                          FallbackLoadingPopup(loadingReason),
                    ),
          ],
        );
      },
      child: widget.child,
    );
  }

  void _notifyUser() {
    final isCurrent = ModalRoute.of(context)?.isCurrent ?? false;
    if (!isCurrent) return;

    Future<void> Function() onConfirm(VoidCallback? onConfirm) => () async {
          _userStateService.reset();
          onConfirm?.call();
          Navigator.of(context).pop();
        };

    if (_userStateService.reason case final InfoReason reason) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            UserStateProvider.of(context)
                .onBuildInfoPopup
                ?.call(reason, onConfirm(reason.onConfirm)) ??
            FallbackInfoPopup(reason, onConfirm(reason.onConfirm)),
      );
    } else if (_userStateService.reason case final ErrorReason reason) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            UserStateProvider.of(context).onBuildErrorPopup?.call(
                  reason,
                  onConfirm(reason.onConfirm),
                ) ??
            FallbackErrorPopup(reason, onConfirm(reason.onConfirm)),
      );
    }
  }
}
