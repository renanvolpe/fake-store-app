import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/presentation/commum_widgets/image_default.dart';
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
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[0].id}"),
                child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[0].images.first, fit: BoxFit.fill)),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[1].id}"),
                child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[1].images.first, fit: BoxFit.fill)),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[2].id}"),
                child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[2].images.first, fit: BoxFit.fill)),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.push("/home/categories/$categoryIndex/products/${listProducts[3].id}"),
                child: Container(
                    color: Colors.amber,
                    margin: const EdgeInsets.all(1),
                    child: ImageDefault(url: listProducts[3].images.first, fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
