import 'dart:convert';

import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_utils.dart';
import 'package:fake_store_joao/data/models/profile.dart';
import 'package:fake_store_joao/data/models/user.dart';
import 'package:fake_store_joao/logic/observer/logger.dart';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

abstract class AuthenticationRequest {
  loginUser(String email, String password);
  getProfile(String token);
}

class AuthenticationRepository implements AuthenticationRequest {
  @override
  Future<Result<String, String>> loginUser(
      String email, String password) async {
    String? errorMessage;

    Uri uri = Uri.https(Endpoints.baseUrl,
        "${Endpoints.v1}${Endpoints.auth}${Endpoints.login}");
    Map body = {
      "email": email,
      "password": password,
    };

    try {
      http.Response response = await http.post(uri,
          headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body));
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = mapDecoded["access_token"];
        return Success(token);
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
  Future<Result<Profile, String>> getProfile(String token) async {
    String? errorMessage;

    Uri uri = Uri.https(Endpoints.baseUrl,
        "${Endpoints.v1}${Endpoints.auth}${Endpoints.profile}");
    Map<String, String> header = {
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "Bearer $token"
    };

    try {
      http.Response response = await http.get(uri, headers: header);
      var mapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        User user = User.fromMap(mapDecoded);
        var profileUser = Profile(token: token, user: user);
        return Success(profileUser);
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
