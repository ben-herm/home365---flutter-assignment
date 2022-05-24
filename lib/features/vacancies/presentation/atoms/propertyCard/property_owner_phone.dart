import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';

class PropertyOwnerPlan extends StatelessWidget {
  const PropertyOwnerPlan({
    required this.plan,
    Key? key,
  }) : super(key: key);

  final String plan;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      plan,
      style: T.fonts.body3.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: T.colors.dark,
      ),
    );
  }
}
