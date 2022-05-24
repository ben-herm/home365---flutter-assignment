import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';

class PropertyAddress extends StatelessWidget {
  const PropertyAddress({
    required this.address,
    Key? key,
  }) : super(key: key);

  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        CustomText(
          'Address: ',
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: T.colors.dark,
          ),
        ),
        const SizedBox(height: 4),
        CustomText(
          address,
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
