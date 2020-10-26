import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/category_page/left_navigation_bar.dart';

import 'file:///D:/keep-learning/learn-flutter/flutter_shop/lib/pages/category_page/category_goods_list.dart';
import 'file:///D:/keep-learning/learn-flutter/flutter_shop/lib/pages/category_page/right_navigation_bar.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        width: ScreenUtil().setWidth(750),
        child: Row(
          children: [
            LeftNavigationBar(),
            SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                RightNavigationBar(),
                CategoryGoodsListWidget(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
