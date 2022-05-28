import 'package:flutter/material.dart';

import '../../../../../core/UI/widgets/shimmer/shimmer_widget.dart';

class PropertyCardShimmer extends StatelessWidget {
  final double height;
  final double width;

  const PropertyCardShimmer({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ShimmerWidget.rectangular(height: 32),
          SizedBox(height: 30),
          ShimmerWidget.rectangular(height: 12),
          SizedBox(height: 30),
          ShimmerWidget.rectangular(height: 12),
        ],
      ),
    );
  }
}
