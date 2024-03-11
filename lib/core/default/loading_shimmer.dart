import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerDefault extends StatelessWidget {
  const LoadingShimmerDefault(
      {super.key, this.height = 120, this.radius = 5, this.boxShadow, this.width, this.child, this.marginV});

  final double height;
  final double? width;
  final double? marginV;
  final double radius;
  final List<BoxShadow>? boxShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: marginV ?? 0),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: boxShadow,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
        ));
  }
}
