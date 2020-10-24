import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/sub_category.dart';
import 'package:provide/provide.dart';

import 'pages/index_page.dart';

void main() {
  SubCategory subCategory = SubCategory();
  CategoryGoodsList categoryGoodsList = CategoryGoodsList();
  Providers providers = Providers();
  providers
    ..provide(Provider<SubCategory>.value(subCategory))
    ..provide(Provider<CategoryGoodsList>.value(categoryGoodsList));
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
        home: IndexPage(),
      ),
    );
  }
}
