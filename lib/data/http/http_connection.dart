import 'dart:convert';

import 'package:fake_store_joao/core/constants/endpoints.dart';
import 'package:fake_store_joao/data/http/http_utils.dart';
import 'package:http/http.dart';
import 'package:result_dart/result_dart.dart';

abstract class HttpService {
  httpGet({required String endpoint, Map<String, String>? params});
  httpPost({required String endpoint, required Map body});
  httpDelete({required String endpoint, required int id});
  httpPut({required String endpoint, required Map body, String? token});
  httpPatch({required String endpoint, required Map body, String? token});
}

class HttpClients implements HttpService {
  static String authority = Endpoints.baseUrl;
  static String v1 = Endpoints.v1;

  @override
  Future<Result<dynamic, String>> httpGet({required String endpoint, Map<String, String>? params}) async {
    String? errorMessage;

    String token = "";

    Uri uri = Uri.https(authority, v1 + endpoint);

    Response response = await get(uri, headers: NetWorkUtils.getHttpHeaders(token));
    var mapDecoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      NetWorkUtils.printLoggSuccess(response);
      return Success(mapDecoded);
    } else {
      errorMessage = "Status code: ${response.statusCode} :: Error: ${mapDecoded["message"]}";

      NetWorkUtils.printLoggError(response, errorMessage);
      return Failure(errorMessage);
    }
  }

  @override
  Future<Result<dynamic, String>> httpPost({required String endpoint, required Map body}) async {
    dynamic errorMessage;
    String token = "";

    Uri uri = Uri.https(authority, v1 + endpoint);

    Response response = await post(uri, headers: NetWorkUtils.postHttpHeaders(token), body: body);
    var mapDecoded = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      NetWorkUtils.printLoggSuccess(response);
      return Success(mapDecoded);
    } else {
      NetWorkUtils.printLoggError(response, errorMessage);
      errorMessage = "Status code: ${response.statusCode} :: Error: ${mapDecoded["message"]}";
      return Failure(errorMessage);
    }
  }

  @override
  Future<Result<dynamic, String>> httpDelete({required String endpoint, required int id}) async {
    dynamic errorMessage;
    String token = "";

    Uri uri = Uri.https(authority, "$v1$endpoint$id");

    Response response = await delete(uri, headers: NetWorkUtils.getHttpHeaders(token));
    var mapDecoded = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      NetWorkUtils.printLoggSuccess(response);
      return Success(mapDecoded);
    } else {
      NetWorkUtils.printLoggError(response, errorMessage);
      errorMessage = "Status code: ${response.statusCode} :: Error: ${mapDecoded["message"]}";
      return Failure(errorMessage);
    }
  }

  @override
  Future<Result<dynamic, String>> httpPatch({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;
    String token = "";

    Uri uri = Uri.https(authority, v1 + endpoint);

    Response response = await patch(uri, headers: NetWorkUtils.getHttpHeaders(token), body: body);
    var mapDecoded = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      NetWorkUtils.printLoggSuccess(response);
      return Success(mapDecoded);
    } else {
      NetWorkUtils.printLoggError(response, errorMessage);
      errorMessage = "Status code: ${response.statusCode} :: Error: ${mapDecoded["message"]}";
      return Failure(errorMessage);
    }
  }

  @override
  Future<Result<dynamic, String>> httpPut({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;
    String token = "";

    Uri uri = Uri.https(authority, v1 + endpoint);

    Response response = await put(uri, headers: NetWorkUtils.postHttpHeaders(token), body: body);
    var mapDecoded = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      NetWorkUtils.printLoggSuccess(response);
      return Success(mapDecoded);
    } else {
      NetWorkUtils.printLoggError(response, errorMessage);
      errorMessage = "Status code: ${response.statusCode} :: Error: ${mapDecoded["message"]}";
      return Failure(errorMessage);
    }
  }
}
