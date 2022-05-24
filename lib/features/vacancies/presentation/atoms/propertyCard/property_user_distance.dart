import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';

class PropertyUserDistance extends StatelessWidget {
  const PropertyUserDistance({
    required this.distance,
    Key? key,
  }) : super(key: key);

  final String distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        CustomText(
          'Distance From User: ',
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: T.colors.dark,
          ),
        ),
        const SizedBox(height: 4),
        CustomText(
          '$distance km',
          textAlign: TextAlign.center,
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: T.colors.dark,
          ),
        )
      ],
    );
  }
}
