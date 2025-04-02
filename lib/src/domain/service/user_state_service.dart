// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_user_state_notifier/src/domain/model/error_reason.dart';
import 'package:flutter_user_state_notifier/src/domain/model/info_reason.dart';
import 'package:flutter_user_state_notifier/src/domain/model/loading_reason.dart';
import 'package:flutter_user_state_notifier/src/domain/model/reason.dart';

class UserStateService extends ChangeNotifier {
  UserStateService() {
    _reason.addListener(notifyListeners);
  }

  final ValueNotifier<Reason?> _reason = ValueNotifier(null);
  Reason? get reason => _reason.value;
  
  bool get isLoading => reason is LoadingReason;

  void setError([ErrorReason? reason]) {
    _reason.value = reason ?? GenericErrorReason();
  }

  void setInfo(InfoReason reason) {
    _reason.value = reason;
  }

  void setLoading([LoadingReason? reason]) {
    _reason.value = reason ?? GenericLoadingReason();
  }

  void reset() {
    _reason.value = null;
  }
}
