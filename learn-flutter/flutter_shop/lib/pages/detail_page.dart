import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/detail_page/goods_info_area.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';

import 'detail_page/tabbar_tabview.dart';

class DetailPage extends StatelessWidget {
  String goodsId = '';

  DetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(builder: (context, child, goodsDetail) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        appBar: AppBar(
          title: Text(
              '${goodsDetail.goodsDetailData.goodInfo == null ? '数据加载中...' : goodsDetail.goodsDetailData.goodInfo.goodsName}'),
        ),
        body: Container(
          width: ScreenUtil().setWidth(750),
          child: ListView(
            children: [
              GoodsInfoArea(goodsDetail.goodsDetailData.goodInfo),
              TabBarTabView(),
            ],
          ),
        ),
      );
    });
  }
}
