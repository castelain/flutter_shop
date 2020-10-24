import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home.dart';

// 首页顶部导航区域
class TopNavigationBar extends StatelessWidget {
  List<Category> navigationItems;

  TopNavigationBar(this.navigationItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(180),
      padding: const EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(),
        children: _buildNavigationItems(),
      ),
    );
  }

  Widget _buildNavigationItem(Category item) {
    return InkWell(
      onTap: () {
        print('点击了顶部导航栏...');
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: ScreenUtil().setHeight(160),
        child: Column(
          children: [
            Image.network(
              item.image,
              width: ScreenUtil().setWidth(95),
            ),
            Text(item.mallCategoryName)
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNavigationItems() {
    List items;
    if (navigationItems.length > 4) {
      items = navigationItems.sublist(0, 4);
    }
    return items.map((item) => _buildNavigationItem(item)).toList();
  }
}
