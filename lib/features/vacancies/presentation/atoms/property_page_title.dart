import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';

class PropertyPageTitle extends StatelessWidget {
  const PropertyPageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
      'Available Vacancies',
      textAlign: TextAlign.center,
      style: T.fonts.body1,
    );
  }
}
