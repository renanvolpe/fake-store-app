import 'dart:convert';

import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import 'authentication_repository_test.mocks.dart';
// class MockHttpClients extends Mock implements HttpClients {}

@GenerateMocks([HttpClientsTest])
void main() {
  late MockHttpClientsTest httpLayerMock;
  late AuthenticationRepository repository;

  setUpAll(() {
    httpLayerMock = MockHttpClientsTest();
    repository = AuthenticationRepository(httpLayerMock);
  });

  group("Groupt of test of user endpoint", () {
    test("login user", () async {
      Map<String, dynamic> body = {"email": "joao@joao.com", "password": "1234"};

      String endpoint = Endpoints.auth + Endpoints.login;

      when(httpLayerMock.httpPost(endpoint: endpoint, body: body))
          .thenAnswer((_) async => Success(jsonDecode(jsonLoginAuthorized)));

      var response = await repository.loginUser(body["email"], body["password"]);

      expect(response, isA<Success>());
    });
  });
}

String jsonLoginAuthorized =
    '{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE3MTE5ODcwMzIsImV4cCI6MTcxMzcxNTAzMn0.nGJCm8tOPz6n7b1wB9dwzcAAvhzZEFdJA8ba80bSA8Q","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE3MTE5ODcwMzIsImV4cCI6MTcxMjAyMzAzMn0.OFs_5UBwv9Nbgt9giWCAMwKlPfS7I5EC7fI5NiisfOU"}';
