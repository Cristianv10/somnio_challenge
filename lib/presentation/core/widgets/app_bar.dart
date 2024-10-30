import 'package:flutter/material.dart';
import 'package:somnio/presentation/core/widgets/text_base.dart';

class ChallengeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChallengeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBase(
              text: 'Somnio Software Challenge',
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
            _buildContainer()
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      color: Colors.transparent,
      width: 20,
      height: 20,
      child: const Icon(
        Icons.star,
        color: Colors.blue,
        size: 20,
      ),
    );
  }
}
