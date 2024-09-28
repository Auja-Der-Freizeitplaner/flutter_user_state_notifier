import 'package:flutter/material.dart';

class MaterialPopup extends StatelessWidget {
  const MaterialPopup({
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
    return AlertDialog(
      title: Text(caption),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text(buttonLabel),
        ),
      ],
    );
  }
}
