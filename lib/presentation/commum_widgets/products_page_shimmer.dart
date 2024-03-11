import 'package:fake_store_joao/core/default/loading_shimmer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

class ProductsPageShimmer extends StatelessWidget {
  const ProductsPageShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < 8; i++) ...[const LoadingShimmerDefault(height: 165, radius: 7), 15.sizeH]
          ],
        ),
      ),
    );
  }
}
