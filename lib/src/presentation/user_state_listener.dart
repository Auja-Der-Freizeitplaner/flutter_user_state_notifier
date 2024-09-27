import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

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
  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((_) => _notifyUser());
    super.didChangeDependencies();
  }

  @override
  void initState() {
    context.userStateService.addListener(_notifyUser);
    super.initState();
  }

  @override
  void dispose() {
    context.userStateService.removeListener(_notifyUser);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: context.userStateService,
      builder: (context, child) {
        late final LoadingReason? loadingReason;
        if (context.userStateService.reason case final LoadingReason reason) {
          loadingReason = reason;
        } else {
          loadingReason = null;
        }

        return Stack(
          children: [
            widget.child,
            if (loadingReason != null)
              loadingReason.isFullScreen
                  ? UserStateProvider.of(context).onBuildLoadingScreen(
                      loadingReason,
                    )
                  : ColoredBox(
                      color: Colors.black.withOpacity(.3),
                      child: UserStateProvider.of(context).onBuildLoadingPopup(
                        loadingReason,
                      ),
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
    final service = context.userStateService;
    if (service.reason case final InfoReason reason) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => UserStateProvider.of(context).onBuildInfoPopup(
          reason,
          () async {
            void pop() => Navigator.of(context).pop();
            service.reset();
            await reason.onConfirm?.call();
            pop();
          },
        ),
      );
    } else if (service.reason case final ErrorReason reason) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => UserStateProvider.of(context).onBuildErrorPopup(
          reason,
          () async {
            void pop() => Navigator.of(context).pop();
            service.reset();
            await reason.onConfirm?.call();
            pop();
          },
        ),
      );
    }
  }
}
