import 'dart:convert';

import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_utils.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/models/product_create.dart';
import 'package:fake_store_joao/core/observer/logger.dart';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

abstract class ProductsRequest {
  getAllProducts(int categoryId);
  getOneProduct(int idProduct);
  updateProduct(Product product);
  deleteProduct(int id);
  createProduct(ProductCreate product);
}

class ProductRepository implements ProductsRequest {
  @override
  Future<Result<Product, String>> createProduct(ProductCreate product) async {
    String? errorMessage;

    Uri uri =
        Uri.https(Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.products}");
    Map body = {
      "title": product.title,
      "images": product.images ,
      "price": product.price.toString(),
      "description": product.description,
      "categoryId": product.categodyId.toString()
    };

    try {
      http.Response response = await http.post(uri,
          headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body) );
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Product product = Product.fromMap(mapDecoded);
        return Success(product);
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
  Future<Result<String, String>> deleteProduct(int id) async {
    String? errorMessage;

    Uri uri = Uri.https(
        Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.products}$id");

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
  Future<Result<List<Product>, String>> getAllProducts(int categoryId) async {
    String? errorMessage;

    final params = {
      'categoryId': categoryId.toString(),
    };
    Uri uri = Uri.https(
        Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.products}", params);

    try {
      http.Response response =
          await http.get(uri, headers: NetWorkUtils.getHttpHeaders());
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<Product> listProduct = [];

        for (var element in mapDecoded) {
          listProduct.add(Product.fromMap(element));
        }
        if (listProduct.isEmpty) {
          errorMessage = "lista de categorias está vazia";
          throw Exception();
        }

        return Success(listProduct);
      }
      errorMessage =
          "Status code: ${response.statusCode}error: ${mapDecoded["message"]}";

      throw Exception();
    } catch (e) {
      Logg.error(errorMessage ?? "Erro não esperado");
    }

    return Failure(errorMessage ?? "Error inesperado");
  }

  @override
  Future<Result<Product, String>> getOneProduct(int idProduct) async {
    String? errorMessage;

    Uri uri = Uri.https(
        Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.products}$idProduct");

    try {
      http.Response response =
          await http.get(uri, headers: NetWorkUtils.getHttpHeaders());
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var product = Product.fromMap(mapDecoded);
        return Success(product);
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
  Future<Result<String, String>> updateProduct(Product product) async {
    String? errorMessage;

    Uri uri = Uri.https(Endpoints.baseUrl,
        "${Endpoints.v1}${Endpoints.products}${product.id}");

    Map<String, dynamic> body = {
      "title": product.title,
      "images": product.images,
      "price": product.price.toString(),
      "description": product.description,
    };

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
