import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';

class PropertyOwnerName extends StatelessWidget {
  const PropertyOwnerName({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        CustomText(
          'Owner Name: ',
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: T.colors.dark,
          ),
        ),
        const SizedBox(height: 4),
        CustomText(
          name,
          textAlign: TextAlign.center,
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: T.colors.dark,
          ),
        )
      ],
    );
  }
}
