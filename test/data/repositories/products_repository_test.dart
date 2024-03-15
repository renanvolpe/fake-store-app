import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/models/product_create.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Test endpoints of Products", () {
    ProductRepository apiProducts = ProductRepository();
    late Product productTest;
    test("Create Products", () async {
      ProductCreate productCreate =
          ProductCreate(title: "new Product", price: 100, description: "description here", categodyId: 28, images: [
        "https://assets-global.website-files.com/5f2a93fe880654a977c51043/620fd215f344f16633f1aafc_hero_2.jpeg"
      ]);

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
  });
}
