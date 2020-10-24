import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widgets/category_goods_list.dart';
import 'package:flutter_shop/widgets/left_navigation_bar.dart';
import 'package:flutter_shop/widgets/right_navigation_bar.dart';

class CategoryPage extends StatelessWidget {
  GlobalKey _categorypageKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
