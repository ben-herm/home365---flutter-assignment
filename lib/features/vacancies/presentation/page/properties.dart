import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_365_assignment/core/UI/widgets/headers/main_header.dart';
import 'package:location/location.dart' hide Location;
import '../../../../core/UI/theme/theme.dart';
import '../../../../core/UI/widgets/loaders/main_circular_loader.dart';
import '../../model/property/property_model.dart';
import '../../model/repository/property_repository_impl.dart';
import '../atoms/google_maps.dart';
import '../atoms/property_page_title.dart';
import '../organism/properties_grid.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Properties extends HookWidget {
  Properties({
    Key? key,
  }) : super(key: key);

  final _getProperties = PropertyModelImpl().getMockedProperties();
  @override
  Widget build(BuildContext context) {
    final isCalculating = useState(true);
    final polyLineFromPropertyToUser =
        useState(Map<PolylineId, Polyline>.from({}));
    final userLanLon = useState(LocationData.fromMap({}));

    return SafeArea(
      child: Scaffold(
        backgroundColor: T.colors.light,
        body: FutureBuilder<List<PropertyModel>>(
          future: _getProperties, // async work
          builder: (
            _,
            AsyncSnapshot<List<PropertyModel>> snapshot,
          ) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  const MainHeader(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          GoogleMaps(
                            onLocationChange: (l) => userLanLon.value = l,
                            polyLineFromPropertyToUser:
                                polyLineFromPropertyToUser.value,
                            isCalculating: isCalculating,
                          ),
                          const SizedBox(height: 4),
                          const PropertyPageTitle(),
                          const SizedBox(height: 4),
                          PropertiesGrid(
                            onTap: (polyLines) =>
                                polyLineFromPropertyToUser.value = polyLines,
                            userLocation: userLanLon.value,
                            properties: snapshot.data!,
                            calculating: isCalculating,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return const MainCircularLoader();
          },
        ),
      ),
    );
  }
}
