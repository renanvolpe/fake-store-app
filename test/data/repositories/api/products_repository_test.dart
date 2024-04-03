import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/category_create.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/models/product_create.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

main() async {
  late ProductRepository apiProducts;
  late Product productTest;

  late CateogriesRepository apiCategorires;
  late Category categoryTest;
  late CategoryCreate categoryCreate;

  setUpAll(() {
    apiCategorires = CateogriesRepository();
    apiProducts = ProductRepository();

    categoryCreate = CategoryCreate(
        name: "new category",
        image: "https://assets-global.website-files.com/5f2a93fe880654a977c51043/620fd215f344f16633f1aafc_hero_2.jpeg");
  });


  tearDownAll(() => null);

  group("Test endpoints of Products", () {
    test("Create category", () async {
      var response = await apiCategorires.createCategory(categoryCreate);
      response.onSuccess((success) => categoryTest = success);

      expect(response, isA<Success>());
    });

    test("Create Products", () async {
      ProductCreate productCreate = ProductCreate.toTest(categoryTest.id);

      var response = await apiProducts.createProduct(productCreate);

      response.onSuccess((success) => productTest = success);

      expect(response, isA<Success>());
    });

    test("Get All products", () async {
      var response = await apiProducts.getAllProducts(productTest.category.id);
      expect(response, isA<Success>());
    });

    test("Get All products but with no category", () async {
      var response = await apiProducts.getAllProducts();
      expect(response, isA<Success>());
    });

    test("Get a product", () async {
      var response = await apiProducts.getOneProduct(productTest.id);
      expect(response, isA<Success>());
    });

    test("Update products", () async {
      productTest.title = "nameTeste";
      var response = await apiProducts.updateProduct(productTest);
      expect(response, isA<Success>());
    });

    test("Delete products", () async {
      var response = await apiProducts.deleteProduct(productTest.id);
      expect(response, isA<Success>());
    });

    test("Delete category", () async {
      var response = await apiCategorires.deleteCategory(categoryTest.id);
      expect(response, isA<Success>());
    });
  });
}
