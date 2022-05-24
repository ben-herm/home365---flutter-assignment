import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';

class PropertyOccupiedStats extends StatelessWidget {
  const PropertyOccupiedStats({
    required this.occupiedStats,
    Key? key,
  }) : super(key: key);

  final String occupiedStats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        CustomText(
          'OccupiedStatus: ',
          style: T.fonts.body3.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: T.colors.dark,
          ),
        ),
        const SizedBox(height: 4),
        CustomText(
          occupiedStats,
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
