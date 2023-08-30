class NetWorkUtils{
  static Map<String, String> getHttpHeaders() {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive"
    };

    return headers;
  }
  static Map<String, String> postHttpHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      'Content-Type': 'application/json; charset=UTF-8',
    };

    return headers;
  }
}