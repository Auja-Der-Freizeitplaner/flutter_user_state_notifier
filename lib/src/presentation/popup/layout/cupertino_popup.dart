import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPopup extends StatelessWidget {
  const CupertinoPopup({
    required this.caption,
    required this.description,
    required this.buttonLabel,
    required this.onTap,
    super.key,
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
                padding: const EdgeInsets.all(8),
                child: Text(
                  buttonLabel,
                  style: const TextStyle(color: CupertinoColors.activeBlue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
