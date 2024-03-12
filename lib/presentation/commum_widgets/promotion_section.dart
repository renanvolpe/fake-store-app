import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/default/loading_shimmer.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({
    super.key,
    required this.categoryIndex,
    required this.listProducts,
  });

  final int categoryIndex;
  final List<Product> listProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Promoções",
          style: Style.defaultLightTextStyle.copyWith(fontSize: 24),
        ),
        15.sizeH,
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: buttonImage(context, 0),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: buttonImage(context, 1),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: buttonImage(context, 2),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: buttonImage(context, 3),
            ),
          ],
        ),
      ],
    );
  }

  InkWell buttonImage(BuildContext context, int i) {
    return InkWell(
      onTap: () => context.pushNamed("product_detail", queryParameters: {"idProd": listProducts[i].id.toString()}),
      child: Container(
          margin: const EdgeInsets.all(1), child: ImageDefault(url: listProducts[i].images.first, fit: BoxFit.fill)),
    );
  }
}

class PromotionSectionShimmer extends StatelessWidget {
  const PromotionSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: const [
        StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: LoadingShimmerDefault()),
        StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 1, child: LoadingShimmerDefault()),
        StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1, child: LoadingShimmerDefault()),
        StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1, child: LoadingShimmerDefault()),
      ],
    );
  }
}
