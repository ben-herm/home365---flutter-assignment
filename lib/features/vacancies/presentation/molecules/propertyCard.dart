import 'package:flutter/material.dart';
import 'package:home_365_assignment/features/vacancies/presentation/atoms/propertyCard/property_owner_name.dart';
import 'package:home_365_assignment/features/vacancies/presentation/atoms/propertyCard/property_owner_rental_fee.dart';
import '../../../../core/UI/theme/theme.dart';
import '../../../../core/utils/mapUtils.dart';
import '../atoms/propertyCard/property_address.dart';
import '../atoms/propertyCard/property_card_shimmer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' hide Location;

import '../atoms/propertyCard/property_user_distance.dart';

class PropertyCard extends HookWidget {
  final String address;
  final Location propertiesLanLon;
  final String name;
  final String occupiedStats;
  final String plan;
  final double height;
  final double width;
  final LocationData userLocation;
  final VoidCallback onTap;
  final bool isLoading;
  const PropertyCard({
    required this.propertiesLanLon,
    required this.onTap,
    required this.address,
    required this.name,
    required this.userLocation,
    required this.plan,
    required this.occupiedStats,
    required this.height,
    required this.width,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return PropertyCardShimmer(height: height, width: width);
    }
    final double distanceFromPropertyToUser = calculateDistance(
      propertiesLanLon.latitude,
      propertiesLanLon.longitude,
      userLocation.latitude,
      userLocation.longitude,
    );

    return InkWell(
      onTap: onTap,
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
                address: address,
              ),
              PropertyOwnerName(
                name: name,
              ),
              PropertyOccupiedStats(occupiedStats: occupiedStats),
              PropertyUserDistance(
                distance: distanceFromPropertyToUser.round().toString(),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -3),
              color: T.colors.light,
              blurRadius: 5,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
