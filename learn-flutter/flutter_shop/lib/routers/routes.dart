import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_handler.dart';

class Routes {
  static String homePage = '/';
  static String detailPage = '/detail';
  static String cartPage = '/cart';
  static void defineRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundPageHandler;
    router.define(homePage, handler: homePageHandler);
    router.define(detailPage, handler: detailPageHandler);
    router.define(cartPage, handler: cartPageHandler);
  }
}
