import 'dart:convert';

import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_connection.dart';
import 'package:fake_store_joao/data/http/http_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import '../presentation/screen/login_page_test.mocks.dart';
import 'http_connection_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late HttpClientsTest httpLayer;

  setUpAll(() {
    mockClient = MockClient();
    httpLayer = HttpClientsTest(mockClient);
  });

  group("test client layer", () {
    test("test call verbs post with success", () async {
      Map<String, dynamic> body = {};

      String endpoint = Endpoints.auth + Endpoints.login;

      Uri uri = Uri.https(Endpoints.baseUrl, Endpoints.v1 + endpoint);

      when(mockClient.post(uri, headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body)))
          .thenAnswer((_) async => http.Response(jsonLoginAuthorized, 200));

      final result = await httpLayer.httpPost(endpoint: endpoint, body: body);

      expect(result, isA<Success>());
    });

    test("test call verbs post with error", () async {
      Map<String, dynamic> body = {};

      String endpoint = Endpoints.auth + Endpoints.login;

      Uri uri = Uri.https(Endpoints.baseUrl, Endpoints.v1 + endpoint);

      when(mockClient.post(uri, headers: NetWorkUtils.postHttpHeaders(), body: jsonEncode(body)))
          .thenAnswer((_) async => http.Response(jsonLoginUnauthorized, 401));

      final result = await httpLayer.httpPost(endpoint: endpoint, body: body);

      expect(result, isA<Failure>());
    });
  });
}

var jsonLoginUnauthorized = '{"message": "Unauthorized", "statusCode": 401}';

var jsonLoginAuthorized =
    '{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE3MTE5ODcwMzIsImV4cCI6MTcxMzcxNTAzMn0.nGJCm8tOPz6n7b1wB9dwzcAAvhzZEFdJA8ba80bSA8Q","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE3MTE5ODcwMzIsImV4cCI6MTcxMjAyMzAzMn0.OFs_5UBwv9Nbgt9giWCAMwKlPfS7I5EC7fI5NiisfOU"}';
