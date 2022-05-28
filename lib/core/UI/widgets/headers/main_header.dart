import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      alignment: Alignment.topLeft,
      color: T.colors.light,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(T.assets.logo),
      ),
    );
  }
}
