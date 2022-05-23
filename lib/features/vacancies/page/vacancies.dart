import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_365_assignment/core/UI/widgets/headers/mainHeader.dart';

import '../atoms/google_maps.dart';

class Vacancies extends HookWidget {
  Vacancies({
    Key? key,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [MainHeader(), GoogleMaps()],
        ),
      ),
    );
  }
}
