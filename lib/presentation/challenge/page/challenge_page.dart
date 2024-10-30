import 'package:flutter/material.dart';
import 'package:somnio/presentation/challenge/view/challenge_view.dart';
import 'package:somnio/presentation/core/widgets/layout.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen to make the layout responsive
    Size size = MediaQuery.of(context).size;
    return ChallengeLayout(
      children: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SizedBox(
            width: size.width * 0.9,
            height: size.height,
            child: const ChallengeView()),
      ),
    );
  }
}
