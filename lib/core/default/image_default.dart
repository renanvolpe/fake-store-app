import 'package:fake_store_joao/core/default/loading_shimmer.dart';
import 'package:flutter/material.dart';

class ImageDefault extends StatelessWidget {
  const ImageDefault({super.key, required this.url, this.height = 120, this.radius = 5, this.fit, this.aligment});

  final String? url;
  final double? height;
  final double? radius;
  final BoxFit? fit;
  final Alignment? aligment;

  @override
  Widget build(BuildContext context) {
    String pathDefaultImage = "assets/images/default_image.jpg";

    return Container(
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius!), color: Colors.grey),
      child: url == null || url == ""
          ? Image.asset(pathDefaultImage, fit: fit ?? BoxFit.scaleDown)
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius!),
              child: Image.network(
                url!,
                fit: fit,
                height: height,
                alignment: aligment ?? Alignment.center,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null ? child : const LoadingShimmerDefault(),
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
                errorBuilder: (context, error, stackTrace) =>
                    ImageDefault(url: "", height: height, radius: radius, fit: fit),
              ),
            ),
    );
  }
}
