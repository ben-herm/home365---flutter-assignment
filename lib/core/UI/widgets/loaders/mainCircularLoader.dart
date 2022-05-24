import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class MainCircularLoader extends StatelessWidget {
  const MainCircularLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(
          T.colors.dark,
        ),
      ),
    );
  }
}
