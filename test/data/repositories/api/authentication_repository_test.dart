import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

// class MockHttpClients extends Mock implements HttpClients {}
void main() {
  late UserRepository apiUser;
  late AuthenticationRepository apiAuth;
  setUpAll(
    () {
      apiUser = UserRepository();
      apiAuth = AuthenticationRepository(HttpClients());
    },
  );

  tearDownAll(() => null);

  var userCrate = UserCreate(
      name: "João Salg",
      email: "joao@joao.com",
      password: "1234",
      avatar: "https://api.lorem.space/image/face?w=640&h=480",
      role: "admin");

  group("Groupt of test of user endpoint", () {
    late String tokenUser;

    test("create a user admin", () async {
      var response = await apiUser.createUser(userCrate);

      expect(response, isA<Success>());
    });

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
