import 'package:flutter/material.dart';

import '../../../../../core/UI/widgets/shimmer/shimmerWidget.dart';

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
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerWidget.circular(height: height, width: width),
          const SizedBox(height: 8),
          const ShimmerWidget.rectangular(height: 12),
          const SizedBox(height: 8),
          const ShimmerWidget.rectangular(height: 12),
        ],
      ),
    );
  }
}
