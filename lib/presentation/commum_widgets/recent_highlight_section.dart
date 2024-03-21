import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/default/loading_shimmer.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class RecentHighlightsSection extends StatelessWidget {
  const RecentHighlightsSection({
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
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Recent highlight",
            style: Style.defaultTextStyle.copyWith(fontSize: 24),
          ),
        ),
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: buttonImage(context, 5),
            ),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 1, child: buttonImage(context, 6)),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: buttonImage(context, 7),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: buttonImage(context, 8),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: buttonImage(context, 9),
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

class RecentHighlightsSectionShimmer extends StatelessWidget {
  const RecentHighlightsSectionShimmer({super.key});

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
        StaggeredGridTile.count(crossAxisCellCount: 4, mainAxisCellCount: 2, child: LoadingShimmerDefault()),
      ],
    );
  }
}
