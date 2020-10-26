import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/goods_detail.dart';
import 'package:flutter_shop/service/service_method.dart';

class GoodsDetailProvide with ChangeNotifier {
  GoodsDetailData goodsDetailData = GoodsDetailData();

  requestGoodsDetailData(String id) async {
    Map data = {'goodId': id};
    await request('goodsDetail', formData: data).then((value) {
      var json = jsonDecode(value.toString());
      goodsDetailData = GoodsDetailModel.fromJson(json).data;
      notifyListeners();
    });
  }
}
