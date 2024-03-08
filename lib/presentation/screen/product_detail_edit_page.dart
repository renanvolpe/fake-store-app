import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/edit_product/edit_poduct_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_product/get_product_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/flushbar_function_not_implemented.dart';
import 'package:fake_store_joao/presentation/commum_widgets/image_default.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailEditPage extends StatefulWidget {
  const ProductDetailEditPage({super.key, required this.idProd});
  final int idProd;
  @override
  State<ProductDetailEditPage> createState() => _ProductDetailEditPageState();
}

class _ProductDetailEditPageState extends State<ProductDetailEditPage> {
  late GetProductBloc getProductController;
  late EditPoductBloc editProductController;

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    getProductController = GetProductBloc(ProductRepository());
    getProductController.add(GetProductStarted(widget.idProd));

    editProductController = EditPoductBloc(ProductRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.kWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: ColorsApp.kWhiteColor,
          ),
        ),
        backgroundColor: ColorsApp.kBackgroundColor,
        centerTitle: true,
        title: Text(
          "Edite o produto",
          style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => BlocConsumer<GetProductBloc, GetProductState>(
          listener: (context, state) {
            if (state is GetProductSuccess) {
              Product product = state.product;
              titleController.text = product.title;
              priceController.text = product.price.toString();
              descriptionController.text = product.description;
            }
          },
          bloc: getProductController,
          builder: (context, state) {
            if (state is GetProductSuccess) {
              Product product = state.product;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.45,
                    child: ImageDefault(
                      url: product.images.first,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.sizeH,
                          TextFormField(
                            controller: titleController,
                          ),
                          15.sizeH,
                          TextFormField(
                            controller: priceController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          15.sizeH,
                          TextFormField(
                            controller: descriptionController,
                          ),
                          15.sizeH,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: BlocConsumer<EditPoductBloc, EditPoductState>(
                                  bloc: editProductController,
                                  listener: (context, state) {
                                    if (state is EditPoductSuccess) {
                                      getProductController.add(GetProductStarted(widget.idProd));
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is EditPoductProgress) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return InkWell(
                                        onTap: () {
                                          var newProd = product;
                                          newProd.title = titleController.text;
                                          newProd.description = descriptionController.text;
                                          newProd.price = int.parse(priceController.text);
                                          editProductController.add(EditProductStarted(product));
                                        },
                                        child: const Icon(Icons.edit));
                                  },
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  flushbarNotImplementedYet(context);
                                },
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  color: Colors.lightBlue,
                                  child: Center(
                                      child: Text(
                                    "Comprar",
                                    style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
                                  )),
                                ),
                              ))
                            ],
                          ),
                          10.sizeH,
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return const Center(child: SizedBox(width: 15, height: 15, child: CircularProgressIndicator()));
          },
        ),
      ),
    );
  }
}
