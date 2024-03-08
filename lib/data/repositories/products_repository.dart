import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/models/product_create.dart';
import 'package:result_dart/result_dart.dart';

abstract class ProductsRequest {
  getAllProducts(int categoryId);
  getOneProduct(int idProduct);
  updateProduct(Product product);
  deleteProduct(int id);
  createProduct(ProductCreate product);
}

class ProductRepository implements ProductsRequest {
  HttpClients connect = HttpClients();

  @override
  Future<Result<Product, String>> createProduct(ProductCreate product) async {
    Map<String, dynamic> body = {
      "title": product.title,
      "images": product.images,
      "price": product.price.toString(),
      "description": product.description,
      "categoryId": product.categodyId.toString()
    };

    var response = await connect.httpPost(endpoint: Endpoints.products, body: body);

    return response.fold((success) {
      var prod = Product.fromMap(success);
      return Success(prod);
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<String, String>> deleteProduct(int id) async {
    var response = await connect.httpDelete(endpoint: Endpoints.products, id: id);

    return response.fold((success) {
      return const Success("sucess");
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<List<Product>, String>> getAllProducts([int? categoryId]) async {
    late Map<String, String> params;
    //if dont have params, send it "{}"
    if (categoryId != null) {
      params = {
        'categoryId': "$categoryId",
      };
    } else {
      params = {};
    }

    var response = await connect.httpGet(endpoint: Endpoints.products, params: params);

    return response.fold((success) {
      List<Product> listProds = [];
      for (var element in success) {
        listProds.add(Product.fromMap(element));
      }
      return Success(listProds);
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<Product, String>> getOneProduct(int idProduct) async {
    var response = await connect.httpGet(endpoint: "${Endpoints.products}$idProduct");

    return response.fold((success) {
      return Success(Product.fromMap(success));
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<String, String>> updateProduct(Product product) async {
    Map<String, dynamic> body = {
      "title": product.title,
      "images": product.images,
      "price": product.price.toString(),
      "description": product.description,
    };

    var response = await connect.httpPut(endpoint: "${Endpoints.products}${product.id}", body: body);

    return response.fold((success) {
      return const Success("success");
    }, (failure) => Failure(failure));
  }
}
