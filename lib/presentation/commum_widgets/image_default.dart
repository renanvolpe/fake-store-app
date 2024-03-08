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
    return url == null || url == ""
        ? ContainerImage(height: height, radius: radius, pathDefaultImage: pathDefaultImage, fit: fit)
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius!),
            child: Image.network(
              url!,
              fit: fit,
              height: height,
              alignment: aligment ?? Alignment.center,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const SizedBox(height: 15, child: CircularProgressIndicator()),
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
              errorBuilder: (context, error, stackTrace) =>
                  ImageDefault(url: "", height: height, radius: radius, fit: fit),
            ),
          );
  }
}

class ContainerImage extends StatelessWidget {
  const ContainerImage({super.key, required this.height, required this.pathDefaultImage, this.radius = 5, this.fit});

  final double? height;
  final String pathDefaultImage;
  final double? radius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius!), color: Colors.grey),
      child: Image.asset(pathDefaultImage, fit: fit ?? BoxFit.scaleDown),
    );
  }
}
