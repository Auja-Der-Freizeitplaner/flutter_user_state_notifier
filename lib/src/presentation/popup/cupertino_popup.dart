import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/src/core/app/app_colors.dart';

class CupertinoPopup extends StatelessWidget {
  const CupertinoPopup({
    super.key,
    required this.caption,
    required this.description,
    required this.buttonLabel,
    required this.onTap,
  });
  final String caption;
  final String description;
  final String buttonLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(caption),
      content: Text(description),
      actions: [
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  buttonLabel,
                  style: TextStyle(color: AppColors.iOSSystemBlue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
