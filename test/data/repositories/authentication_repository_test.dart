import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Groupt of test of user endpoint", () {
    AuthenticationRepository apiAuth = AuthenticationRepository();
    late String tokenUser;
    test("login user", () async {
      var response = await apiAuth.loginUser("joao@joao.com", "1234");

      response.onSuccess((success) => tokenUser = success);

      expect(response, isA<Success>());
    });

    test("get user s profile ", () async {
      var response = await apiAuth.getProfile(tokenUser);

      expect(response, isA<Success>());
    });
  });
}
