import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc_event.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc_state.dart';
import 'package:somnio/presentation/challenge/view/header_widget.dart';
import 'package:somnio/presentation/challenge/view/post_list_widget.dart';
import 'package:somnio/presentation/core/widgets/error_widget.dart';
import 'package:somnio/presentation/core/widgets/loading_widget.dart';
import 'package:somnio/presentation/core/widgets/text_base.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({super.key});

  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Color _tabColor = Colors.blue;

  @override
  void initState() {
    // Load the post information when the view is initialized
    super.initState();
    context.read<ChallengeBloc>().add(LoadPostInformation());
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index != 0) {
        _tabController.index = 0;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(),
        const SizedBox(height: 8.0),
        TabBar(
          controller: _tabController,
          indicatorColor: _tabColor,
          labelColor: _tabColor,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              icon: Icon(Icons.article),
              child: TextBase(
                text: 'Posts',
              ),
            ),
            Tab(
              icon: Icon(Icons.favorite),
              child: TextBase(
                text: 'Favorites',
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              BlocBuilder<ChallengeBloc, ChallengeState>(
                builder: (context, state) {
                  if (state is ChallengeLoading) {
                    return const LoadingWidget();
                  } else if (state is ChallengeError) {
                    return CustomErrorWidget(message: state.message);
                  } else if (state is ChallengeLoaded) {
                    return PostListWidget(posts: state.data);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const Center(child: TextBase(text: 'Favorites are disabled')),
            ],
          ),
        ),
      ],
    );
  }
}
