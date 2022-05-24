import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_365_assignment/core/UI/widgets/headers/mainHeader.dart';
import 'package:location/location.dart' hide Location;
import '../../../../core/UI/widgets/loaders/mainCircularLoader.dart';
import '../../model/property/property_model.dart';
import '../../model/repository/property_repository_impl.dart';
import '../atoms/google_maps.dart';
import '../atoms/property_page_title.dart';
import '../organism/propertiesGrid.dart';
import 'package:geocoding/geocoding.dart';

class Vacancies extends HookWidget {
  Vacancies({
    Key? key,
  }) : super(key: key);

  Timer? timer;
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);
    final userLanLon = useState(LocationData.fromMap({}));
    final properties = useState(
      List.generate(
        0,
        (index) => PropertyModel.empty(),
      ),
    );
    // create a lists of Location
    final propertiesLanLonList = useState(
      List<Location>.generate(
        0,
        (i) => Location.fromMap(
          {},
        ),
      ),
    );

    useEffect(
      () {
        WidgetsBinding.instance?.addPostFrameCallback(
          (timeStamp) async {
            properties.value = await PropertyModelImpl().getMockedProperties();
            propertiesLanLonList.value =
                await PropertyModelImpl().getPropertiesLanLon(properties.value);
          },
        );
        return () {};
      },
      [],
    );

    if (properties.value.isNotEmpty && propertiesLanLonList.value.isNotEmpty) {
      isLoading.value = false;
    }

    return SafeArea(
      child: Scaffold(
        body: !isLoading.value
            ? Column(
                children: [
                  const MainHeader(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          GoogleMaps(
                            onLocationChange: (l) => userLanLon.value = l,
                          ),
                          const SizedBox(height: 16),
                          const PropertyPageTitle(),
                          const SizedBox(height: 8),
                          Expanded(
                            child: PropertiesGrid(
                              propertiesLanLon: propertiesLanLonList.value,
                              userLocation: userLanLon.value,
                              properties: properties.value,
                              isLoading: false,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : const MainCircularLoader(),
      ),
    );
  }
}
