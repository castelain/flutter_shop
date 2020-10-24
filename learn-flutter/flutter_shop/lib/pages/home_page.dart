import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/model/home.dart';
import 'package:flutter_shop/widgets/ad_banner.dart';
import 'package:flutter_shop/widgets/floor_area.dart';
import 'package:flutter_shop/widgets/hot_area.dart';
import 'package:flutter_shop/widgets/leader_phone.dart';
import 'package:flutter_shop/widgets/my_swiper.dart';
import 'package:flutter_shop/widgets/recommend_list.dart';
import 'package:flutter_shop/widgets/top_navigation_bar.dart';

import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<_HomePageState> _homepageKey = GlobalKey<_HomePageState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: request('homePagePath', formData: formData),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data.toString());
            HomeModel homeContent = HomeModel.fromJson(data['data']);
            List swiperList = homeContent.slides;
            List<Category> navigationItems = homeContent.category;
            String imgSrcAd = homeContent.advertesPicture?.pictureAddress;
            String leaderPhoneNum = homeContent.shopInfo?.leaderPhone;
            String imgSrcLeader = homeContent.shopInfo?.leaderImage;
            List recommendList = homeContent.recommend;
            IntegralMallPic floor1Pic = homeContent.floor1Pic;
            List<Floor> floor1 = homeContent.floor1;
            IntegralMallPic floor2Pic = homeContent.floor2Pic;
            List<Floor> floor2 = homeContent.floor2;
            IntegralMallPic floor3Pic = homeContent.floor3Pic;
            List<Floor> floor3 = homeContent.floor3;

            return EasyRefresh(
              enableControlFinishLoad: true,
              footer: ClassicalFooter(
                  key: _homepageKey,
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  infoColor: Colors.black26,
                  loadingText: '加载中...',
                  loadReadyText: '上拉加载更多！',
                  noMoreText: '没有更多啦...'),
              onLoad: () async {
                var data = {'page': hotAreaKey.currentState.page};
                await request('hotAreaPath', formData: data).then((val) {
                  setState(() {
                    hotAreaKey.currentState.hotItems = jsonDecode(val)['data'];
                    hotAreaKey.currentState.page++;
                  });
                });
              },
              child: ListView(
                children: [
                  // 首页轮播图
                  MySwiper(swiperList),
                  // 顶部分类导航栏
                  TopNavigationBar(navigationItems),
                  // 广告 banner
                  AdBanner(imgSrcAd),
                  // 首页拨打电话区域
                  LeaderPhone(leaderPhoneNum, imgSrcLeader),
                  // 商品推荐区域
                  RecommendList(recommendList),
                  // 楼层区域
                  FloorArea(floor1Pic, floor1),
                  FloorArea(floor2Pic, floor2),
                  FloorArea(floor3Pic, floor3),
                  // 火爆专区
                  HotArea(
                    key: hotAreaKey,
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('轮播图数据加载中...'),
            );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
