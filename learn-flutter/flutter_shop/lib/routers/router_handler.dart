import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart_page.dart';
import 'package:flutter_shop/pages/category_page.dart';
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

Handler cartPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CartPage();
});

Handler categoryHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CategoryPage();
});
