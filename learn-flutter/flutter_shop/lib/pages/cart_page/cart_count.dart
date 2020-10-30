import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';

// ignore: must_be_immutable
class CartCount extends StatelessWidget {
  int num;
  String goodsId;

  CartCount(this.num, this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _buildDecreaseBtn(context, goodsId),
          _buildCountNum(num),
          _buildIncreaseBtn(context, goodsId),
        ],
      ),
    );
  }

  Widget _buildDecreaseBtn(BuildContext context, String goodsId) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).decreaseGoods(goodsId);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 240, 1),
            border: Border.all(
              color: Colors.black26,
              width: 0.8,
            )),
        child: Text(
          '-',
          style: TextStyle(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }

  Widget _buildCountNum(int num) {
    return Container(
      width: ScreenUtil().setWidth(45),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: Colors.black26,
          width: 0.8,
        ),
        bottom: BorderSide(
          color: Colors.black26,
          width: 0.8,
        ),
      )),
      child: Text(
        '$num',
      ),
    );
  }

  Widget _buildIncreaseBtn(BuildContext context, String goodsId) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).increaseGoods(goodsId);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black26,
          width: 0.8,
        )),
        child: Text(
          '+',
          style: TextStyle(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
