import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/category_create.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Test endpoints of categories", () {
    CateogriesRepository apiCategorires = CateogriesRepository();
    late Category categoryTest;
    test("Create category", () async {
      CategoryCreate categoryCreate = CategoryCreate(
          name: "new category",
          image:
              "https://assets-global.website-files.com/5f2a93fe880654a977c51043/620fd215f344f16633f1aafc_hero_2.jpeg");
      var response = await apiCategorires.createCategory(categoryCreate);
      response.onSuccess((success) => categoryTest = success);

      expect(response, isA<Success>());
    });

    //run products teste

    test("Get All categories", () async {
      var response = await apiCategorires.getAllCategories();
      expect(response, isA<Success>());
    });

    test("Get One categories", () async {
      var response = await apiCategorires.getOneCategory(categoryTest.id);
      expect(response, isA<Success>());
    });

    test("Update category", () async {
      categoryTest.name = "nameTeste";
      var response = await apiCategorires.updateCategory(categoryTest);
      expect(response, isA<Success>());
    });

    test("Delete category", () async {
      var response = await apiCategorires.deleteCategory(categoryTest.id);
      expect(response, isA<Success>());
    });
  });
}
