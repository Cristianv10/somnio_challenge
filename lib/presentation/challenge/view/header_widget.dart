import 'package:flutter/material.dart';
import 'package:somnio/presentation/core/widgets/text_base.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: const TextBase(
            text: 'Blog',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextBase(
            text: 'Welcome To Our Blog',
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
