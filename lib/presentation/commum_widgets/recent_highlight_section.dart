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
            "Destaques recentes",
            style: Style.defaultLightTextStyle.copyWith(fontSize: 24),
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
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[5].id}"),
                child: Container(
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[5].images.first, fit: BoxFit.fill)),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[6].id}"),
                child: Container(
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[6].images.first, fit: BoxFit.fill)),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[7].id}"),
                child: Container(
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[7].images.first, fit: BoxFit.fill)),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[8].id}"),
                child: Container(
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[8].images.first, fit: BoxFit.fill)),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[9].id}"),
                child: Container(
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(
                      url: listProducts[9].images.first,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ],
        ),
      ],
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
