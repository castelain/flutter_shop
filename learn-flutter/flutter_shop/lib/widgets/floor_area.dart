import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home.dart';

// 首页楼层区域
class FloorArea extends StatelessWidget {
  IntegralMallPic floorPic;
  List<Floor> floorItems;

  FloorArea(this.floorPic, this.floorItems);

  @override
  Widget build(BuildContext context) {
    Map map = floorItems.asMap();
    return Container(
        width: ScreenUtil().setWidth(750),
        child: Column(
          children: [
            FloorTitle(floorPic),
            Row(
              children: [
                FloorItem(map[0]),
                Column(
                  children: [
                    FloorItem(map[1]),
                    FloorItem(map[2]),
                  ],
                )
              ],
            ),
            Row(
              children: [
                FloorItem(map[3]),
                FloorItem(map[4]),
              ],
            )
          ],
        ));
  }
}

class FloorTitle extends StatelessWidget {
  IntegralMallPic floorPic;

  FloorTitle(this.floorPic);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print('点击了楼层标题图片: ${floorPic.toPlace}');
        },
        child: Image.network(floorPic.pictureAddress),
      ),
    );
  }
}

class FloorItem extends StatelessWidget {
  Floor floorItem;

  FloorItem(this.floorItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print('点击了楼层物品: ${floorItem.goodsId}');
        },
        child: Image.network(floorItem.image),
      ),
    );
  }
}
