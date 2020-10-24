import 'package:flutter/material.dart';

import '../model/category_goods.dart';

class CategoryGoodsList with ChangeNotifier {
  List<CategoryGoods> categoryGoodsList = [];

  void setCategoryGoodsList(List<CategoryGoods> list) {
    categoryGoodsList = list;
    notifyListeners();
  }
}
