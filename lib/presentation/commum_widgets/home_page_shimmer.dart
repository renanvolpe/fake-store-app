import 'package:fake_store_joao/presentation/commum_widgets/promotion_section.dart';
import 'package:fake_store_joao/presentation/commum_widgets/recent_highlight_section.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 20.sizeH,
          // const SelectCategoriesAndAddress(),
          40.sizeH,
          const PromotionSectionShimmer(),
          60.sizeH,
          const RecentHighlightsSectionShimmer(),
          25.sizeH
        ],
      ),
    );
  }
}
