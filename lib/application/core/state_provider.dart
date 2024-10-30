import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc.dart';
import 'package:somnio/domain/challenge/repository/challenge_repository.dart';
import 'package:somnio/infrastructure/core/injector.dart';

class ChallengeStateProvider extends StatelessWidget {
  final Widget child;

  const ChallengeStateProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final challengeRepository = Injector.resolve<ChallengeRepository>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChallengeBloc(challengeRepository),
        ),
      ],
      child: child,
    );
  }
}
