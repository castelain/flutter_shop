import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/detail_page.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/pages/not_found_page.dart';

Handler homePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

Handler notFoundPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NotFoundPage();
});

Handler detailPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DetailPage(params['id'][0]);
});
