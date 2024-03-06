import 'package:fake_store_joao/logic/observer/logger.dart';
import 'package:http/http.dart';

class NetWorkUtils{
  static Map<String, String> getHttpHeaders([String? token]
  ) {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "Bearer $token"
    };

    return headers;
  }
  static Map<String, String> postHttpHeaders([String? token]) {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      'Content-Type': 'application/json; charset=UTF-8',
       "Authorization": "Bearer $token"
    };

    return headers;
  }

  static   printLoggSuccess(Response response) => Logg.consoleShow(
      "ENDPOINT :: ${response.request?.url} \nVERB :: ${response.request?.method} \nResponse :: ${response.statusCode} => ${ResponseCode().getValue(response.statusCode)}");
 static   printLoggError(Response response, String errorMessage) => Logg.error(
      "ENDPOINT :: ${response.request?.url} \nVERB :: ${response.request?.method}  \nSTATUS CODE :: ${response.statusCode} => ${ResponseCode().getValue(response.statusCode)}  \nErrorMessage :: $errorMessage");

}



class ResponseCode {
  String getValue(int num) {
    switch (num) {
      case success:
        return "success";
      case noContent:
        return "no_content";
      case badRequest:
        return "bad_request";
      case unauthorized:
        return "unauthorized";
      case forbidden:
        return "forbidden";
      case internalServerError:
        return "internal_server_error";
      case notFound:
        return "not_found";
      default:
        return "unknown";
    }
  }

  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, resource not found
}

// class ErrorTretment {
//   static String getError(DioException e) {
//     String errorMessage = "algum erro";

//     if (e.response?.data != null) {
//       try {
//         if (e.response!.data["errors"] != null) {
//           errorMessage = e.response!.data["errors"][0]["title"];
//         }
//         if (e.response!.data["error"] != null) {
//           errorMessage = e.response!.data["error"];
//         }
//       } catch (e) {
//         errorMessage = "Erro desconhecido";
//       }
//     } else {
//       errorMessage = "Erro desconhecido";
//     }

//     switch (e.response?.statusCode) {
//       case 401:
//         Modular.to.pushNamed("/");
//         break;
//       default:
//     }
//     _printLoggError(e, errorMessage);
//     return errorMessage;
//   }

//   static void _printLoggError(DioException e, String errorMessage) => Logg.error(
//       "ENDPOINT :: ${e.requestOptions.path} \nVERB :: ${e.requestOptions.method}  \nSTATUS CODE :: ${e.response?.statusCode}  \nErrorMessage :: $errorMessage");
// }