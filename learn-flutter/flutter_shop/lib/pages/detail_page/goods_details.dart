import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';

class GoodsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<GoodsDetailProvide>(
        builder: (context, child, goodsDetail) {
          if (goodsDetail.goodsDetailData.goodInfo == null) {
            return Center(
              child: Text('数据加载中...'),
            );
          } else {
            return Html(data: goodsDetail.goodsDetailData.goodInfo.goodsDetail);
          }
        },
      ),
    );
  }
}
