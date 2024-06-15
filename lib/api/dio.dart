import 'package:dio/dio.dart';

dynamic makeHttpRequest(String url, dynamic datas) async {
  Dio dio = Dio();

  // 设置全局报头
  dio.options.headers['Authorization'] = 'Bearer your_token';
  dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
  // 或者在每个请求中单独设置报头
/*   Map<String, dynamic> headers = {
    'Authorization': 'Bearer your_token',
  }; */

  Response response = await dio.post(url, data: datas);
  if (response.statusCode == 200) {
    // 处理响应数据
    return (response.data);
  }

  // 处理响应数据
  return response;
}
