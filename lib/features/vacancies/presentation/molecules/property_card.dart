import 'package:flutter/material.dart';
import 'package:home_365_assignment/core/UI/widgets/textWidgets/text.dart';
import '../../../../core/UI/theme/theme.dart';
import '../../../../core/UI/widgets/buttons/custom_button.dart';
import '../../../../core/utils/mapUtils.dart';
import '../../model/property/property_model.dart';
import '../../model/repository/property_repository_impl.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:location/location.dart' hide Location;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../atoms/propertyCard/all.dart';
import '../atoms/property_card_dialog.dart';

class PropertyCard extends HookWidget {
  final Coordinates propertiesLanLon;
  final PropertyModel property;
  final LocationData userLocation;
  final VoidCallback onSelect;
  final Function(Map<PolylineId, Polyline>) onTap;
  final ValueNotifier<bool> calculatingPolyline;
  const PropertyCard({
    required this.propertiesLanLon,
    required this.onTap,
    required this.onSelect,
    required this.property,
    required this.userLocation,
    required this.calculatingPolyline,
    Key? key,
  }) : super(key: key);

  void _propertyPressed(
    BuildContext context,
    String distanceFromPropertyToUser,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return PropertyCardDialog(
          onTap: onSelect,
          isSelected: property.isSelected,
          property: property,
          distanceFromPropertyToUser: distanceFromPropertyToUser,
        );
      },
    );
  }

  void _calculatePolylines() async {
    calculatingPolyline.value = true;
    final Map<PolylineId, Polyline> polyLines =
        await PropertyModelImpl().createPolylines(
      userLocation.latitude!,
      userLocation.longitude!,
      propertiesLanLon.latitude!,
      propertiesLanLon.longitude!,
    );
    calculatingPolyline.value = false;
    onTap(polyLines);
  }

  @override
  Widget build(BuildContext context) {
    if (calculatingPolyline.value) {
      return const PropertyCardShimmer(height: 175, width: 175);
    }
    final String distanceFromPropertyToUser = MapUtils.calculateDistance(
      propertiesLanLon.latitude,
      propertiesLanLon.longitude,
      userLocation.latitude,
      userLocation.longitude,
    ).round().toString();

    return InkWell(
      onTap: _calculatePolylines,
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: Container(
          padding: const EdgeInsets.all(4),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: T.colors.light,
              width: .2,
            ),
            shape: BoxShape.rectangle,
            color: T.colors.lightGrey,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomButton(
                  text: CustomText(
                    'Select',
                    style: T.fonts.body3,
                  ),
                  color: T.colors.dark,
                  onTap: () => _propertyPressed(
                    context,
                    distanceFromPropertyToUser,
                  ),
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(
          color: property.isSelected ? T.colors.dark : T.colors.light,
          style: BorderStyle.solid,
          width: 1.0,
        )),
      ),
    );
  }
}
