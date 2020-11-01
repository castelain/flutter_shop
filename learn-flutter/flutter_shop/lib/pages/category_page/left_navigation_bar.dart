import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/sub_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';

class LeftNavigationBar extends StatefulWidget {
  @override
  _LeftNavigationBarState createState() => _LeftNavigationBarState();
}

class _LeftNavigationBarState extends State<LeftNavigationBar> {
  List<Category> categoryList = [];
  // 当前选中的分类项的 index
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // 页面初始化
    // 获取分类数据
    _getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    if (categoryList == null || categoryList.length == 0) {
      return Text('分类数据没有...');
    } else {
      return Container(
        width: ScreenUtil().setWidth(180),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                right: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
        child: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) => _buildLeftNavigationBarItem(index),
        ),
      );
    }
  }

  void _getCategoryData() async {
    await request('categoryPath').then((value) {
      var data = jsonDecode(value.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        CategoryModel category = CategoryModel.fromJson(data);
        categoryList = category.data;
      });

      String categoryId = Provide.value<SubCategory>(context).categoryId;
      if (categoryId != "") {
        for (int i = 0; i < categoryList.length; i++) {
          if (categoryList[i].mallCategoryId == categoryId) {
            setState(() {
              _currentIndex = i;
            });
            break;
          }
        }
      } else {
        setState(() {
          _currentIndex = 0;
        });
      }
      Provide.value<SubCategory>(context)
          .setSubCategory(categoryList[_currentIndex].bxMallSubDto);

      // 设置‘全部’的主 id
      Provide.value<SubCategory>(context)
          .setCategoryId(categoryList[_currentIndex].mallCategoryId);
      // 设置第一项子类被选中
      Provide.value<SubCategory>(context).setCategorySubId('');
      // 设置第一项分类对应的商品列表数据
      _getCategoryGoodsList();
    });
  }

  void _getCategoryGoodsList() async {
    Map formData = {
      'categoryId': '${Provide.value<SubCategory>(context).categoryId}',
      'categorySubId': '${Provide.value<SubCategory>(context).categorySubId}',
      'page': '${Provide.value<SubCategory>(context).page}',
    };
    print('formData: ${formData}');
    await request('goodsListPath', formData: formData).then((value) {
      CategoryGoodsModel data =
          CategoryGoodsModel.fromJson(jsonDecode(value.toString()));
      Provide.value<CategoryGoodsList>(context).setCategoryGoodsList(data.data);
      print('data: ${data.data.length}');
    });
  }

  Widget _buildLeftNavigationBarItem(int index) {
    Category item = categoryList[index];
    return InkWell(
      onTap: () {
        Provide.value<SubCategory>(context).setCategoryId(item.mallCategoryId);
        Provide.value<SubCategory>(context).setCategorySubId('');
        Provide.value<SubCategory>(context).setCurrentIndex(0);
        // 点击左侧分类大项时，设置 provide 里的右侧分类项的数据
        Provide.value<SubCategory>(context).setSubCategory(item.bxMallSubDto);
        // 重置 page
        Provide.value<SubCategory>(context).resetPage();
        // 设置分类商品列表
        _getCategoryGoodsList();
        // 设置当前选中的分类项 index
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
          height: ScreenUtil().setHeight(80),
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              // 设置选中的项目背景为浅灰色
              color: _currentIndex == index
                  ? Color.fromRGBO(236, 238, 239, 1.0)
                  : Colors.white,
              border: Border(
                  bottom: BorderSide(
                width: 0.6,
                color: Colors.black12,
              ))),
          child: Text(
            '${item.mallCategoryName}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
            ),
          )),
    );
  }
}
