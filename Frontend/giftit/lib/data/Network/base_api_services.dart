import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(String url, dynamic data, dynamic header);

  Future<dynamic> putApi(String url, dynamic data);

  Future<dynamic> putApiWithMultipart(
    String url,
    Map<String, String> fields,
    String fileFieldName,
    File file,
  );
}
