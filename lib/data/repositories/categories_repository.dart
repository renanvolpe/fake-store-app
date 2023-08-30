import 'dart:convert';

import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_utils.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/category_create.dart';
import 'package:fake_store_joao/logic/observer/logger.dart';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

abstract class CategoriesRequest {
  getAllCategories();
  getOneCategory(int id);
  updateCategory(Category category);
  deleteCategory(int id);
  createCategory(CategoryCreate category);
}

class CateogriesRepository implements CategoriesRequest {
  @override
  Future<Result<Category, String>> createCategory(
      CategoryCreate category) async {
    String? errorMessage;

    Uri uri =
        Uri.https(Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.categories}");

    Map<String, String> body = {"name": category.name, "image": category.image};

    try {
      http.Response response = await http.post(uri,
          headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body));
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Category category = Category.fromMap(mapDecoded);
        return Success(category);
      } else {
        errorMessage =
            "Status code: ${response.statusCode} :: Error: ${mapDecoded["message"]}";

        throw Exception();
      }
    } catch (e) {
      Logg.error(errorMessage ?? e.toString());
    }

    return Failure(errorMessage ?? "Error inesperado");
  }

  @override
  Future<Result<String, String>> deleteCategory(int id) async {
    String? errorMessage;

    Uri uri = Uri.https(
        Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.categories}$id");

    try {
      http.Response response =
          await http.delete(uri, headers: NetWorkUtils.getHttpHeaders());
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return const Success("Deleção de categoria com sucesso");
      } else {
        errorMessage =
            "Status code: ${response.statusCode}error: ${mapDecoded["message"]}";

        throw Exception();
      }
    } catch (e) {
      Logg.error("$errorMessage ?? Erro não esperado");
    }

    return Failure(errorMessage ?? "Error inesperado");
  }

  @override
  Future<Result<List<Category>, String>> getAllCategories() async {
    String? errorMessage;

    Uri uri =
        Uri.https(Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.categories}");

    try {
      http.Response response =
          await http.get(uri, headers: NetWorkUtils.getHttpHeaders());
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<Category> listCategories = [];

        for (var element in mapDecoded) {
          listCategories.add(Category.fromMap(element));
        }
        if (listCategories.isEmpty) {
          errorMessage = "lista de categorias está vazia";
          throw Exception();
        }

        return Success(listCategories);
      }
      errorMessage =
          "Status code: ${response.statusCode}error: ${mapDecoded["message"]}";

      throw Exception();
    } catch (e) {
      Logg.error("$errorMessage ?? Erro não esperado");
    }

    return Failure(errorMessage ?? "Error inesperado");
  }

  @override
  Future<Result<Category, String>> getOneCategory(int id) async {
    String? errorMessage;

    Uri uri = Uri.https(
        Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.categories}$id");

    try {
      http.Response response =
          await http.get(uri, headers: NetWorkUtils.getHttpHeaders());
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var category = Category.fromMap(mapDecoded);
        return Success(category);
      } else {
        errorMessage =
            "Status code: ${response.statusCode}error: ${mapDecoded["message"]}";

        throw Exception();
      }
    } catch (e) {
      Logg.error("$errorMessage ?? Erro não esperado");
    }

    return Failure(errorMessage ?? "Error inesperado");
  }

  @override
  updateCategory(Category category) async {
    String? errorMessage;

    Uri uri = Uri.https(Endpoints.baseUrl,
        "${Endpoints.v1}${Endpoints.categories}${category.id}");

    Map<String, String> body = {"name": category.name, "image": category.image};

    try {
      http.Response response = await http.put(uri,
          headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body));
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return const Success("Categoria atualizada com sucesso");
      } else {
        errorMessage =
            "Status code: ${response.statusCode} :: Error: ${mapDecoded["message"]}";

        throw Exception();
      }
    } catch (e) {
      Logg.error(errorMessage ?? e.toString());
    }

    return Failure(errorMessage ?? "Error inesperado");
  }
}
