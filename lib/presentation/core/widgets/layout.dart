import 'package:flutter/material.dart';
import 'package:somnio/presentation/core/widgets/app_bar.dart';

class ChallengeLayout extends StatelessWidget {
  final Widget children;
  final bool showSafeArea;
  const ChallengeLayout({
    super.key,
    required this.children,
    this.showSafeArea = true,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const ChallengeAppBar(),
        body: SafeArea(
          top: showSafeArea,
          bottom: showSafeArea,
          child: children,
        ),
      ),
    );
  }
}
