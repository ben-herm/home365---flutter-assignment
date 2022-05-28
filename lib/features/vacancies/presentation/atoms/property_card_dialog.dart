import 'package:flutter/material.dart';

import '../../../../../core/UI/theme/theme.dart';
import '../../../../../core/UI/widgets/textWidgets/text.dart';
import '../../../../core/UI/widgets/buttons/custom_button.dart';
import '../../model/property/property_model.dart';
import 'propertyCard/all.dart';

class PropertyCardDialog extends StatelessWidget {
  const PropertyCardDialog({
    required this.property,
    required this.distanceFromPropertyToUser,
    Key? key,
  }) : super(key: key);

  final PropertyModel property;
  final String distanceFromPropertyToUser;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(property.address),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PropertyAddress(
            address: property.address,
          ),
          PropertyOwnerName(
            name: property.owner,
          ),
          PropertyOccupiedStats(occupiedStats: property.occupiedStats),
          PropertyUserDistance(
            distance: distanceFromPropertyToUser,
          ),
          PropertyTenant(tenant: property.tenant)
        ],
      ),
      actions: <Widget>[
        CustomButton(
          color: T.colors.lightGrey,
          text: const CustomText('Select'),
          onTap: () => {
            Navigator.pop(context),
          },
        ),
      ],
    );
  }
}
