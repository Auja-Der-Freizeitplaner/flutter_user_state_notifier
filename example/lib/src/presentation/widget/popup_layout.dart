import 'package:flutter/material.dart';

class PopupLayout extends StatelessWidget {
  const PopupLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: DecoratedBox(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white),
            child: Padding(padding: const EdgeInsets.all(16), child: child),
          ),
        ),
      ),
    );
  }
}
