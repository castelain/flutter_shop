import 'dart:async';

import 'package:dio/dio.dart';

import '../config/service_url.dart';

Future request(url, {formData}) async {
  try {
    Dio dio = Dio();
    dio.options = BaseOptions(
      contentType: "application/x-www-form-urlencoded",
    );
    Response response;
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口 $url 出现异常，请检查代码和服务器情况...');
    }
  } catch (e) {
    return print(e);
  }
}
