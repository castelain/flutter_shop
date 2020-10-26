import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/model/home.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';

// 首页轮播图
class MySwiper extends StatelessWidget {
  final List<Slides> swiperList;

  MySwiper(this.swiperList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: swiperList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              String id = swiperList[index].goodsId;
              Provide.value<GoodsDetailProvide>(context)
                  .requestGoodsDetailData(id);
              Application.router.navigateTo(context, '/detail?id=$id');
            },
            child: Image.network(
              swiperList[index].image,
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
