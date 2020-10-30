import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/pages/detail_page/goods_details.dart';

import 'goods_comments.dart';

class TabBarTabView extends StatefulWidget {
  @override
  _TabBarTabViewState createState() => _TabBarTabViewState();
}

class _TabBarTabViewState extends State<TabBarTabView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> _tabs = <Tab>[
    Tab(
      text: '详情',
    ),
    Tab(
      text: '评论',
    )
  ];

  List<Widget> _tabBarViews = <Widget>[
    GoodsDetails(),
    GoodsComments(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(2200),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // 为false时不会推导，使中间/标题拉伸
          automaticallyImplyLeading: false,
          elevation: 1,
          title: TabBar(
            tabs: _tabs,
            controller: _tabController,
            indicatorColor: Colors.pink,
            indicatorWeight: 2,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabBarViews,
        ),
      ),
    );
  }
}
