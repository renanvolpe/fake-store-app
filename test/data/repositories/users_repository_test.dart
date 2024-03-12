import 'package:fake_store_joao/data/models/user.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group("Groupt of test of user endpoint", () {
    UserRepository apiUser = UserRepository();
    late User userTest;
    test("create a user admin", () async {
      var userCrate = UserCreate(
          name: "João Salg",
          email: "joao@joao.com",
          password: "1234",
          avatar: "https://api.lorem.space/image/face?w=640&h=480",
          role: "admin");

      var response = await apiUser.createUser(userCrate);

      response.onSuccess((success) => userTest = success);

      expect(response, isA<Success>());
    });

    test("create a user costumer", () async {
      var userCrate = UserCreate(
          name: "Renan Volpe",
          email: "renan@renan.com",
          password: "1234",
          avatar: "https://api.lorem.space/image/face?w=640&h=480",
          role: "costumer");

      var response = await apiUser.createUser(userCrate);

      response.onSuccess((success) => userTest = success);

      expect(response, isA<Success>());
    });

    test("update a user", () async {
      var response = await apiUser.updateUser(userTest);

      expect(response, isA<Success>());
    });
  });
}
