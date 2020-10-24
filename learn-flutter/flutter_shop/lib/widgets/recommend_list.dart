import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home.dart';

class RecommendList extends StatelessWidget {
  List<Recommend> recommendList;
  RecommendList(this.recommendList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        children: [_buildTitle(), _buildRecommendList()],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 1.0))),
      child: Text(
        '商品推荐',
        style: TextStyle(
          color: Colors.pink,
        ),
      ),
    );
  }

  Widget _buildRecomendItem(Recommend item) {
    return Container(
      width: ScreenUtil().setWidth(250),
      height: ScreenUtil().setHeight(260),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black12, width: 1.0))),
      child: Column(
        children: [
          Image.network(item.image),
          Text('${item.mallPrice}'),
          Text(
            '￥${item.price}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  Widget _buildRecommendList() {
    return Container(
      height: ScreenUtil().setHeight(300),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _buildRecomendItem(recommendList[index]);
          }),
    );
  }
}
