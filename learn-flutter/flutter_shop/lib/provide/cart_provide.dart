import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_goods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  List<CartGoodsModel> list = [];
  int goodsNum = 0;
  double goodsSum = 0;
  bool isSelectedAll = true; //标识是否全选

  // 添加商品进购物车
  void addToCart(String goodsId, String goodsName, int count, String image,
      double price) async {
    print('开始添加购物车商品...');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String rawData = sharedPreferences.getString('cartList');
    List previousList = rawData == null ? [] : (jsonDecode(rawData) as List);
    previousList == []
        ? list = []
        : previousList.map((item) => {list.add(CartGoodsModel.fromJson(item))});
    bool isExist = false;
    for (var i = 0; i < list.length; i++) {
      if (list[i].goodsId == goodsId) {
        list[i].count++;
        isExist = true;
        break;
      }
    }
    if (!isExist) {
      list.add(CartGoodsModel(
        goodsId: goodsId,
        goodsName: goodsName,
        count: count,
        image: image,
        price: price,
        isChecked: true,
      ));
    }
    goodsNum = list.length;
    goodsSum += price;
    sharedPreferences.setString('cartList', jsonEncode(list).toString());
    print('购物车里有: ${jsonEncode(list).toString()}');
    notifyListeners();
  }

  // 同步持久化数据到购物车列表
  void asyncCartGoods() async {
    print('同步持久化数据到购物车列表');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String rawData = sharedPreferences.getString('cartList');
    if (rawData == null) {
      list = [];
    } else {
      List tempList = jsonDecode(rawData) as List;
      tempList.map((item) => list.add(CartGoodsModel.fromJson(item)));
    }
    notifyListeners();
  }

  // 同步购物车信息：商品数目、商品总价
  void asyncCartInfo() {
    goodsNum = list.length;
    goodsSum = 0;
    list.forEach((element) {
      goodsSum += element.price * element.count;
    });
    notifyListeners();
  }

  // 从移除商品，同步持久化数据
  void removeGoods(String goodsId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for (int i = 0; i < list.length; i++) {
      if (list[i].goodsId == goodsId) {
        goodsSum -= list[i].price;
        list.removeAt(i);
        break;
      }
    }
    goodsNum = list.length;
    sharedPreferences.setString('cartList', jsonEncode(list).toString());
    notifyListeners();
  }

  // 切换指定商品选定与否,更新本地持久化数据
  void toggleSelectGoods(String goodsId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isSelectedAll = true;
    for (int i = 0; i < list.length; i++) {
      if (list[i].goodsId == goodsId) {
        list[i].isChecked = !list[i].isChecked;
        if (list[i].isChecked) {
          goodsNum++;
          goodsSum += list[i].price * list[i].count;
        } else {
          goodsNum--;
          goodsSum -= list[i].price * list[i].count;
        }
        if (!list[i].isChecked) {
          isSelectedAll = false;
        }
      }
    }
    sharedPreferences.setString('cartList', jsonEncode(list).toString());
    notifyListeners();
  }

  // 切换全选，更新本地持久化数据
  void toggleSelectAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isSelectedAll) {
      for (int i = 0; i < list.length; i++) {
        list[i].isChecked = false;
      }
      goodsNum = 0;
      goodsSum = 0;
    } else {
      for (int i = 0; i < list.length; i++) {
        list[i].isChecked = true;
        goodsSum += list[i].price * list[i].count;
      }
      goodsNum = list.length;
    }
    isSelectedAll = !isSelectedAll;
    sharedPreferences.setString('cartList', jsonEncode(list).toString());
    notifyListeners();
  }

  // 商品数量减一，同步本地持久化数据
  void decreaseGoods(String goodsId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for (int i = 0; i < list.length; i++) {
      if (list[i].goodsId == goodsId) {
        if (list[i].isChecked) {
          goodsSum -= list[i].price;
        }
        list[i].count -= 1;
        if (list[i].count == 0) {
          list.removeAt(i);
          goodsNum--;
        }
        break;
      }
    }
    sharedPreferences.setString('cartList', jsonEncode(list).toString());
    notifyListeners();
  }

  // 商品数量加一，同步本地持久化数据
  void increaseGoods(String goodsId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for (int i = 0; i < list.length; i++) {
      if (list[i].goodsId == goodsId) {
        if (list[i].isChecked) {
          goodsSum += list[i].price;
        }
        list[i].count += 1;
        break;
      }
    }
    sharedPreferences.setString('cartList', jsonEncode(list).toString());
    notifyListeners();
  }

  // 清空购物车，清空本地持久化数据
  void clearCart() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    list = [];
    goodsNum = 0;
    goodsSum = 0;
    sharedPreferences.remove('cartList');
    print('清空购物车完成...');
    notifyListeners();
  }
}
