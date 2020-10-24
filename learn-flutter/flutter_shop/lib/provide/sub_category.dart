import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

class SubCategory with ChangeNotifier {
  List<BxMallSubDto> subCategoryList;
  String categoryId = "";
  String categorySubId = "";
  int currentIndex = 0;
  int page = 1;

  void setSubCategory(List<BxMallSubDto> list) {
    // 二级分类中，添加‘全部’选项
    BxMallSubDto allItem = BxMallSubDto(
      mallSubId: '',
      mallCategoryId: categoryId,
      mallSubName: '全部',
      comments: null,
    );
    subCategoryList = [allItem];
    subCategoryList.addAll(list);

    notifyListeners();
  }

  void setCategorySubId(String id) {
    categorySubId = id;
    notifyListeners();
  }

  void setCategoryId(String id) {
    categoryId = id;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void addPage() {
    page++;
    notifyListeners();
  }

  void resetPage() {
    page = 1;
    notifyListeners();
  }
}
