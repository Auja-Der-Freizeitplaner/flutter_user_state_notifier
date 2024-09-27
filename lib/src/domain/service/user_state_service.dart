import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_user_state_notifier/src/domain/model/error_reason.dart';
import 'package:flutter_user_state_notifier/src/domain/model/info_reason.dart';
import 'package:flutter_user_state_notifier/src/domain/model/loading_reason.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

class UserStateService extends ChangeNotifier {
  UserStateService({
    ErrorReason? genericErrorReason,
    LoadingReason? genericLoadingReason,
  }) {
    _genericError = genericErrorReason;
    _genericLoading = genericLoadingReason;
    _reason.addListener(notifyListeners);
  }

  late final ErrorReason? _genericError;
  late final LoadingReason? _genericLoading;

  final ValueNotifier<Reason?> _reason = ValueNotifier(null);
  Reason? get reason => _reason.value;

  void setError([ErrorReason? reason]) {
    _reason.value = reason ?? _genericError ?? GenericErrorReason();
  }

  void setInfo(InfoReason reason) {
    _reason.value = reason;
  }

  void setLoading([LoadingReason? reason]) {
    _reason.value = reason ?? _genericLoading ?? GenericLoadingReason();
  }

  void reset() {
    _reason.value = null;
  }
}
