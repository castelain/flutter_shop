import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/sub_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';

class RightNavigationBar extends StatefulWidget {
  @override
  _RightNavigationBarState createState() => _RightNavigationBarState();
}

class _RightNavigationBarState extends State<RightNavigationBar> {
  List<BxMallSubDto> subCategoryList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(80),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.6,
            color: Colors.black12,
          ),
        ),
      ),
      // 使用 Provide widget 来获取 provide 中的数据
      child: Provide<SubCategory>(builder: (context, child, subCategory) {
        subCategoryList = subCategory.subCategoryList;
        if (subCategoryList == null || subCategoryList.length == 0) {
          return Text('二级分类没有数据...');
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subCategoryList.length,
            itemBuilder: (context, index) =>
                _buildRightNavigationBarItem(index),
          );
        }
      }),
    );
  }

  void _getCategoryGoodsList() async {
    Map formData = {
      'categoryId':
          '${subCategoryList[Provide.value<SubCategory>(context).currentIndex].mallCategoryId}',
      'categorySubId': '${Provide.value<SubCategory>(context).categorySubId}',
      'page': '${Provide.value<SubCategory>(context).page}',
    };
    print('formData: ${formData}');
    await request('goodsListPath', formData: formData).then((value) {
      CategoryGoodsModel data =
          CategoryGoodsModel.fromJson(jsonDecode(value.toString()));
      Provide.value<CategoryGoodsList>(context).setCategoryGoodsList(data.data);
    });
  }

  Widget _buildRightNavigationBarItem(int index) {
    BxMallSubDto item = subCategoryList[index];
    return InkWell(
      onTap: () {
        // 设置被点击的二级分类子项
        Provide.value<SubCategory>(context).setCategorySubId(item.mallSubId);
        Provide.value<SubCategory>(context).setCurrentIndex(index);
        // 重置 page
        Provide.value<SubCategory>(context).resetPage();
        _getCategoryGoodsList();
      },
      child: Container(
        height: ScreenUtil().setHeight(80),
        color: Colors.white,
        margin: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.center,
        child: Text(
          '${item.mallSubName}',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: Provide.value<SubCategory>(context).currentIndex == index
                ? Colors.pink
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
