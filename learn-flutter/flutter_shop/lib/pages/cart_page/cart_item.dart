import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_goods.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';

import 'cart_count.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartGoodsModel goods;

  CartItem(this.goods);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.all(14),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black12, width: 0.8),
            top: BorderSide(color: Colors.black12, width: 0.8),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCheckBtn(context, goods.goodsId, goods.isChecked),
          _buildImage(goods.image),
          Expanded(
              child: _buildTitleAndNum(
                  goods.goodsName, goods.count, goods.goodsId)),
          _buildPriceAndDeleteBtn(context, goods.price, goods.goodsId),
        ],
      ),
    );
  }

  Widget _buildCheckBtn(BuildContext context, String goodsId, bool isChecked) {
    return Container(
      child: Checkbox(
        value: isChecked,
        activeColor: Colors.red,
        onChanged: (value) {
          Provide.value<CartProvide>(context).toggleSelectGoods(goodsId);
        },
      ),
    );
  }

  Widget _buildImage(img) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black26, width: 0.8)),
      child: Image.network(
        img,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitleAndNum(String title, int num, String goodsId) {
    return Container(
      margin: const EdgeInsets.only(
        left: 14,
      ),
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"$title"',
          ),
          CartCount(num, goodsId),
        ],
      ),
    );
  }

  Widget _buildPriceAndDeleteBtn(
      BuildContext context, double price, String goodsId) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '￥ $price',
            style: TextStyle(fontSize: ScreenUtil().setSp(34)),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              height: ScreenUtil().setHeight(80),
              child: IconButton(
                  iconSize: 34,
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.black26,
                  ),
                  onPressed: () {
                    Provide.value<CartProvide>(context).removeGoods(goodsId);
                  }))
        ],
      ),
    );
  }
}
