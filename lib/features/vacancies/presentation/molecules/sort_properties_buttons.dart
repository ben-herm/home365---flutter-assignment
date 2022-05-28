import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../core/UI/widgets/buttons/custom_button.dart';
import '../organism/properties_grid.dart';

class SortPropertiesButtons extends StatelessWidget {
  const SortPropertiesButtons({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Function(SortBy) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            text: Text(
              'Sort by distance',
              style: T.fonts.body3.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: T.colors.light,
              ),
            ),
            color: T.colors.dark,
            onTap: () => onTap(SortBy.distance),
          ),
          CustomButton(
            text: Text(
              'Sort by name',
              style: T.fonts.body3.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: T.colors.light,
              ),
            ),
            color: T.colors.orange,
            onTap: () => onTap(SortBy.name),
          )
        ],
      ),
    );
  }
}
