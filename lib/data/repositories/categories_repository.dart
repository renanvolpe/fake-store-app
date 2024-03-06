import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/category_create.dart';
import 'package:result_dart/result_dart.dart';

abstract class CategoriesRequest {
  getAllCategories();
  getOneCategory(int id);
  updateCategory(Category category);
  deleteCategory(int id);
  createCategory(CategoryCreate category);
}

class CateogriesRepository implements CategoriesRequest {
  HttpClients connect = HttpClients();
  @override
  Future<Result<Category, String>> createCategory(CategoryCreate category) async {
    Map<String, String> body = {"name": category.name, "image": category.image};

    var response = await connect.httpPost(endpoint: Endpoints.categories, body: body);
    return response.fold((success) {
      var category = Category.fromMap(success);
      return Success(category);
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<String, String>> deleteCategory(int id) async {
    var response = await connect.httpDelete(endpoint: Endpoints.categories, id: id);
    return response.fold((success) {
      return const Success("");
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<List<Category>, String>> getAllCategories() async {
    var response = await connect.httpGet(endpoint: Endpoints.categories);
    return response.fold((success) {
      List<Category> listCategory = [];
      for (var element in success) {
        listCategory.add(Category.fromMap(element));
      }
      return Success(listCategory);
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<Category, String>> getOneCategory(int id) async {
    var response = await connect.httpGet(endpoint: "${Endpoints.categories}$id");
    return response.fold((success) {
      var category = Category.fromMap(success);
      return Success(category);
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<String, String>> updateCategory(Category category) async {
    Map<String, String> body = {"name": category.name, "image": category.image};

    var response = await connect.httpPut(endpoint: "${Endpoints.categories}${category.id}", body: body);
    return response.fold((success) {
      return const Success("");
    }, (failure) => Failure(failure));
  }
}
