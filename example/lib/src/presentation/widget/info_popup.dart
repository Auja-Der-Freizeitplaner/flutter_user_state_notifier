import 'package:example/src/presentation/widget/popup_layout.dart';
import 'package:flutter/material.dart';

class InfoPopup extends StatelessWidget {
  const InfoPopup({
    super.key,
    required this.caption,
    required this.description,
    required this.buttonLabel,
    required this.onConfirm,
  });

  final String caption;
  final String description;
  final String buttonLabel;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return PopupLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            caption,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(description),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onConfirm,
            child: Text(buttonLabel),
          )
        ],
      ),
    );
  }
}