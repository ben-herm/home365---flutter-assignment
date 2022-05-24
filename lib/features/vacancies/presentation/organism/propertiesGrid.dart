import 'package:flutter/material.dart';

import '../../model/property/property_model.dart';
import '../molecules/propertyCard.dart';
import 'package:location/location.dart' hide Location;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geocoding/geocoding.dart';

class PropertiesGrid extends HookWidget {
  const PropertiesGrid({
    required this.propertiesLanLon,
    required this.userLocation,
    required this.isLoading,
    required this.properties,
    Key? key,
  }) : super(key: key);

  final List<PropertyModel> properties;
  final bool isLoading;
  final LocationData userLocation;
  final List<Location> propertiesLanLon;
  @override
  Widget build(BuildContext context) {
    const itemWidth = 150.0;
    const itemHeight = 250.0;

    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final property = properties[index];
              return PropertyCard(
                propertiesLanLon: propertiesLanLon[index],
                userLocation: userLocation,
                occupiedStats: property.occupiedStats,
                address: property.address,
                height: 100,
                width: 150,
                name: property.owner,
                plan: property.plan,
                onTap: () {},
                isLoading: isLoading,
              );
            },
            childCount: properties.length,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.75,
            mainAxisSpacing: 20,
            crossAxisSpacing: 0,
            childAspectRatio: itemWidth / itemHeight,
          ),
        ),
      ],
    );
  }
}
