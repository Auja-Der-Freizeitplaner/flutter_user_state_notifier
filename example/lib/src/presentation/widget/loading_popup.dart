import 'package:example/src/presentation/widget/popup_layout.dart';
import 'package:flutter/material.dart';

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({
    super.key,
    required this.caption,
    required this.description,
  });

  final String caption;
  final String description;

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
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(description),
        ],
      ),
    );
  }
}
