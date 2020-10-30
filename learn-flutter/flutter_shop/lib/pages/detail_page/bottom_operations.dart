import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/goods_detail.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

// ignore: must_be_immutable
class BottomOperations extends StatelessWidget {
  GoodsInfo goodsInfo = GoodsInfo();
  @override
  Widget build(BuildContext context) {
    goodsInfo =
        Provide.value<GoodsDetailProvide>(context).goodsDetailData.goodInfo;
    return Container(
      child: Row(
        children: [
          _buildCartBtn(context),
          _buildAddToCart(context),
          _buildBuyNow(context),
        ],
      ),
    );
  }

  Widget _buildCartBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/cart');
      },
      child: Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(110),
        height: ScreenUtil().setHeight(80),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.pink,
            ),
            Provide<CartProvide>(
              builder: (context, child, data) {
                int num = data.goodsNum;
                if (num > 0) {
                  return Positioned(
                      left: ScreenUtil().setWidth(56),
                      top: ScreenUtil().setHeight(10),
                      child: Container(
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setHeight(24),
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          '$num',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        ),
                      ));
                } else {
                  return Text('');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCart(context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).addToCart(goodsInfo.goodsId,
            goodsInfo.goodsName, 1, goodsInfo.image1, goodsInfo.presentPrice);
      },
      child: Container(
        color: Colors.green,
        width: ScreenUtil().setWidth(320),
        height: ScreenUtil().setHeight(80),
        alignment: Alignment.center,
        child: Text(
          '加入购物车',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(36),
          ),
        ),
      ),
    );
  }

  Widget _buildBuyNow(context) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
            msg: '购买成功！',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.pink,
            textColor: Colors.white,
            fontSize: 16.0);
        Provide.value<CartProvide>(context).clearCart();
      },
      child: Container(
        color: Colors.red,
        width: ScreenUtil().setWidth(320),
        height: ScreenUtil().setHeight(80),
        alignment: Alignment.center,
        child: Text(
          '立即购买',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(36),
          ),
        ),
      ),
    );
  }
}
