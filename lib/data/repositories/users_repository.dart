import 'dart:convert';

import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_utils.dart';
import 'package:fake_store_joao/data/models/user.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:fake_store_joao/core/observer/logger.dart';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

abstract class UsersRequest {
  createUser(UserCreate userCreate);
  updateUser(User user);
}

class UserRepository implements UsersRequest {
  @override
  Future<Result<User, String>> createUser(UserCreate userCreate) async {
    String? errorMessage;

    Uri uri = Uri.https(Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.users}");
    Map body = {
      "name": userCreate.name,
      "email": userCreate.email,
      "password": userCreate.password,
      "avatar": userCreate.avatar,
      "role": "customer"
    };

    try {
      http.Response response = await http.post(uri,
          headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body));
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        User user = User.fromMap(mapDecoded);
        return Success(user);
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
  Future<Result<User, String>> updateUser(User user) async {
    String? errorMessage;

    Uri uri = Uri.https(
        Endpoints.baseUrl, "${Endpoints.v1}${Endpoints.users}${user.id}");
    Map body = {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "avatar": user.avatar,
    };

    try {
      http.Response response = await http.put(uri,
          headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body));
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        User user = User.fromMap(mapDecoded);
        return Success(user);
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
