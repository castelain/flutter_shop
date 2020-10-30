import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/goods_detail.dart';

// ignore: must_be_immutable
class GoodsInfoArea extends StatelessWidget {
  GoodsInfo goodsInfo;

  GoodsInfoArea(this.goodsInfo);

  Widget customLabel = Container(
    padding: const EdgeInsets.all(2),
    margin: const EdgeInsets.only(top: 8, bottom: 8),
    decoration: BoxDecoration(
        color: Color.fromRGBO(200, 255, 200, 0.6),
        border: Border(
          top: BorderSide(width: 0.6, color: Colors.green),
          bottom: BorderSide(width: 0.6, color: Colors.green),
          left: BorderSide(width: 0.6, color: Colors.green),
          right: BorderSide(width: 0.6, color: Colors.green),
        )),
    child: Text(
      '支持配送到家',
      style: TextStyle(
        color: Colors.green,
        fontSize: ScreenUtil().setSp(18),
      ),
    ),
  );

  Widget customDes = Container(
    color: Colors.white,
    width: ScreenUtil().setWidth(750),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 10, bottom: 10),
    child: Text(
      '说明：> 急速送达 > 正品保证',
      style: TextStyle(
        color: Color.fromRGBO(255, 100, 100, 1),
        fontSize: ScreenUtil().setSp(20),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (goodsInfo == null) {
      return Center(
        child: Text('暂时没有详情数据...'),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGoodsImage(goodsInfo.image1),
          _buildContent(goodsInfo),
          customDes,
        ],
      );
    }
  }

  Widget _buildGoodsImage(String img) {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      child: Image.network(
        img,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildSerialNum(String serialNum) {
    return Container(
      child: Text(
        '编号：$serialNum',
        style: TextStyle(color: Colors.black38),
      ),
    );
  }

  Widget _buildPrice(double oriPrice, double presentPrice) {
    return Container(
      child: Row(
        children: [
          Text(
            '￥$oriPrice',
            style: TextStyle(
              color: Colors.red,
              fontSize: ScreenUtil().setSp(32),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text('市场价：'),
          ),
          Text(
            '￥$presentPrice',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(GoodsInfo goodsInfo) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${goodsInfo.goodsName}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
            ),
          ),
          customLabel,
          _buildSerialNum(goodsInfo.goodsSerialNumber),
          _buildPrice(goodsInfo.oriPrice, goodsInfo.presentPrice),
        ],
      ),
    );
  }
}
