import 'package:flutter/material.dart';
import 'package:somnio/domain/challenge/entities/post.dart';
import 'package:somnio/presentation/challenge/view/post_card_widget.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCardWidget(post: posts[index]);
      },
      shrinkWrap: true, // Makes the ListView take only the required height
      physics:
          const AlwaysScrollableScrollPhysics(), // Allows scrolling within the ListView
    );
  }
}
