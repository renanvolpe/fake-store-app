import 'package:fake_store_joao/core/default/loading_shimmer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

class CategoriesPageShimmer extends StatelessWidget {
  const CategoriesPageShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          for (int i = 0; i < 4; i++) ...[5.sizeH, const LoadingShimmerDefault(height: 330), 15.sizeH]
        ],
      ),
    ));
  }
}
