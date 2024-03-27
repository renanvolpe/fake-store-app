import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthenticationRequest {
  Future<Result<String, String>> loginUser(String email, String password);
  getProfile(String token);
}

class AuthenticationRepository implements AuthenticationRequest {
  final HttpClientsTest _connect;
  AuthenticationRepository(this._connect);
  
  @override
  Future<Result<String, String>> loginUser(String email, String password) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    var response = await _connect.httpPost(endpoint: Endpoints.auth + Endpoints.login, body: body);

    return response.fold((success) {
      return Success(success["access_token"]);
    }, (failure) => Failure(failure));
  }

  @override
  Future<Result<User, String>> getProfile(String token) async {
    var response = await _connect.httpGet(endpoint: "${Endpoints.auth}${Endpoints.profile}", token: token);

    return response.fold((success) {
      var profile = User.fromMap(success);
      return Success(profile);
    }, (failure) => Failure(failure));
  }
}
