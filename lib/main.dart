import 'package:flutter/material.dart';
import 'package:somnio/application/core/state_provider.dart';
import 'package:somnio/infrastructure/core/injector.dart';
import 'package:somnio/presentation/challenge/page/challenge_page.dart';

void main() {
  Injector.setup();
  runApp(const ChallengeApp());
}

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChallengeStateProvider(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ChallengePage(),
      ),
    );
  }
}
