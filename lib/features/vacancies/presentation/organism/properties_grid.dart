import 'package:flutter/cupertino.dart';
import '../../../../core/utils/mapUtils.dart';
import '../../model/property/property_model.dart';
import '../atoms/propertyCard/property_card_shimmer.dart';
import '../molecules/property_card.dart';
import 'package:location/location.dart' hide Location;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_geocoder/geocoder.dart';
import '../molecules/sort_properties_buttons.dart';

class PropertiesGrid extends StatefulWidget {
  const PropertiesGrid({
    required this.userLocation,
    required this.onTap,
    required this.calculating,
    required this.properties,
    Key? key,
  }) : super(key: key);

  final List<PropertyModel> properties;
  final ValueNotifier<bool> calculating;
  final LocationData userLocation;
  final Function(Map<PolylineId, Polyline>) onTap;

  @override
  State<PropertiesGrid> createState() => _PropertiesGridState();
}

enum SortBy { normal, distance, name }

class _PropertiesGridState extends State<PropertiesGrid> {
  late final Future<List<PropertyModel>> _getPropertiesLanLon;
  final ScrollController myScrollWorks = ScrollController();
  int _currentSelectedIndex = -1;
  SortBy _sortPropertiesType = SortBy.normal;
  @override
  void initState() {
    super.initState();
    _getPropertiesLanLon = MapUtils.addCoordinatesToProperties(
        widget.properties, _sortPropertiesType, widget.userLocation);
  }

  void _onSelect(int index) {
    setState(
      () {
        _currentSelectedIndex == index
            ? _currentSelectedIndex = -1
            : _currentSelectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const itemWidth = 150.0;
    const itemHeight = 175.0;
    return Expanded(
      child: Column(
        children: [
          SortPropertiesButtons(
            onTap: (sortType) => setState(() => _sortPropertiesType = sortType),
          ),
          Expanded(
            child: FutureBuilder<List<PropertyModel>>(
              future: _getPropertiesLanLon, // async work
              builder: (_, AsyncSnapshot<List<PropertyModel>> snapshot) {
                return PrimaryScrollController(
                  controller: myScrollWorks,
                  child: CupertinoScrollbar(
                    isAlwaysShown: true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomScrollView(
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                if (snapshot.hasData) {
                                  final sortedProperties =
                                      MapUtils.sortPropertiesByType(
                                    snapshot.data!.toSet().toList(),
                                    _sortPropertiesType,
                                    widget.userLocation,
                                  );
                                  final property = sortedProperties[index]
                                      .copyWith(
                                          isSelected:
                                              _currentSelectedIndex == index);
                                  return PropertyCard(
                                    propertiesLanLon: Coordinates(
                                      property.coordinates?[0],
                                      property.coordinates?[1],
                                    ),
                                    userLocation: widget.userLocation,
                                    property: property,
                                    onSelect: () => _onSelect(index),
                                    onTap: (polyLines) {
                                      widget.onTap(polyLines);
                                    },
                                    calculatingPolyline: widget.calculating,
                                  );
                                }
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const PropertyCardShimmer(
                                    height: 175,
                                    width: 150,
                                  ),
                                );
                              },
                              childCount: widget.properties.length,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  MediaQuery.of(context).size.width,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 0,
                              childAspectRatio: itemWidth / itemHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
