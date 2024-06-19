import 'package:dio/dio.dart';

dynamic makeHttpRequest(String url, dynamic data) async {
  Dio dio = Dio();

  dio.options.headers['Authorization'] = 'Bearer your_token';
  dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';

  Response response = await dio.post(url, data: data);

  if (response.statusCode == 200) {
    return response.data;
  }

  print(response);
  return response;
}
