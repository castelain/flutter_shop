import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_goods.dart';
import 'package:flutter_shop/pages/cart_page/bottom_operation_bar.dart';
import 'package:flutter_shop/pages/cart_page/cart_item.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';

Widget _buildNoContent(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          width: ScreenUtil().setWidth(180),
          height: ScreenUtil().setHeight(180),
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 70,
              color: Colors.white,
            ),
          )),
      Text(
        '购物车还空着，快去挑选商品吧',
        style: TextStyle(color: Colors.black38),
      ),
      Container(
        width: ScreenUtil().setWidth(200),
        child: RaisedButton(
          color: Colors.red,
          child: Text(
            '随便逛逛',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // Application.router.navigateTo(context, '/');
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return IndexPage();
            }), (route) => false);
          },
        ),
      )
    ],
  );
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Container(
        width: ScreenUtil().setWidth(750),
        child: FutureBuilder(
            future: _getCartInfo(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Provide<CartProvide>(
                  builder: (context, child, data) {
                    if (data.list.length == 0) {
                      return _buildNoContent(context);
                    } else {
                      List<CartGoodsModel> cartGoodsList = data.list;
                      int goodsNum = data.goodsNum;
                      double goodsSum = data.goodsSum;
                      bool isSelectedAll = data.isSelectedAll;
                      return Stack(
                        children: [
                          ListView.builder(
                              itemCount: cartGoodsList.length,
                              itemBuilder: (context, index) {
                                return CartItem(cartGoodsList[index]);
                              }),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: BottomOperationBar(
                                goodsNum, goodsSum, isSelectedAll),
                          ),
                        ],
                      );
                    }
                  },
                );
              } else {
                return Center(
                  child: Text('数据加载中...'),
                );
              }
            }),
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    Provide.value<CartProvide>(context).asyncCartGoods();
    // Provide.value<CartProvide>(context).asyncCartInfo();
    print('同步购物车数据结束: ${Provide.value<CartProvide>(context).list}');
    return '同步购物车数据结束...';
  }

  Widget _buildSum(int length, double sum) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('共$length件商品'),
          Text(
            '小计：￥$sum',
            style: TextStyle(
              color: Colors.pink,
            ),
          )
        ],
      ),
    );
  }
}
