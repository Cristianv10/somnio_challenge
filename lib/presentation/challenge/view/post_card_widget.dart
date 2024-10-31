import 'package:flutter/material.dart';
import 'package:somnio/domain/challenge/entities/post.dart';
import 'package:somnio/presentation/core/widgets/text_base.dart';

class PostCardWidget extends StatelessWidget {
  final Post post; // Make sure to replace Post with your actual model

  const PostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 223, 230),
        border: Border.all(color: Colors.blue, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBase(
            text: post.title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 8.0),
          TextBase(text: post.body, fontSize: 14),
          const SizedBox(height: 8.0),
          const ReadMore(),
          Image.asset(
            'assets/google_io.png',
            height: 65.0,
          ),
        ],
      ),
    );
  }
}

class ReadMore extends StatelessWidget {
  const ReadMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      focusColor: Colors.grey,
      hoverColor: Colors.grey,
      child: const Row(
        children: [
          TextBase(
            text: 'Read More',
            color: Colors.blue,
          ),
          SizedBox(width: 4.0),
          Icon(
            Icons.arrow_forward_outlined,
            size: 16,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
