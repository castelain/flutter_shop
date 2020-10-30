import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:flutter_shop/provide/sub_category.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:provide/provide.dart';

import 'pages/index_page.dart';

void main() {
  SubCategory subCategory = SubCategory();
  CategoryGoodsList categoryGoodsList = CategoryGoodsList();
  GoodsDetailProvide goodsDetailProvide = GoodsDetailProvide();
  CartProvide cartProvide = CartProvide();
  Providers providers = Providers();
  providers
    ..provide(Provider<SubCategory>.value(subCategory))
    ..provide(Provider<CategoryGoodsList>.value(categoryGoodsList))
    ..provide(Provider<GoodsDetailProvide>.value(goodsDetailProvide))
    ..provide(Provider<CartProvide>.value(cartProvide));

  //全局注入路由
  FluroRouter router = FluroRouter();
  Routes.defineRoutes(router);
  Application.router = router;
  // 全局注入 providers
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        onGenerateRoute: Application.router.generator,
        home: IndexPage(),
      ),
    );
  }
}
