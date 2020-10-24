import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'config/HttpHeaders.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputController = TextEditingController();
  String result = '';

  @override
  void initState() {
    super.initState();
    result = '响应数据显示在这！';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dio demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('dio http demo'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                autofocus: false,
                decoration: InputDecoration(
                    labelText: '水果名字：',
                    helperText: '请输入水果名字！',
                    contentPadding: const EdgeInsets.all(4.0)),
                controller: inputController,
              ),
              RaisedButton(child: Text('点击查询'), onPressed: handleSubmit),
              Text(
                result,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getFruit(String name) async {
    try {
      var data = {name: inputController.text.toString()};
      var _dio = Dio();
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
      };
      _dio.options.headers = headers;
      Response response = await _dio.get(
          // 'https://www.easy-mock.com/mock/5f8becbdaed7a3476f050fa6/test/fruit',
          'https://time.geekbang.org/serv/v2/explore/all',
          queryParameters: data);
      print(response);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  void handleSubmit() {
    String input = inputController.text.toString();
    print('input: $input');
    if (input == '') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('水果名称不可为空！'),
            );
          });
    } else {
      getFruit(input).then((val) {
        setState(() {
          result = '查询的水果是：${val['data']}';
        });
      });
    }
  }
}
