import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

// ignore: must_be_immutable
class BottomOperationBar extends StatelessWidget {
  int num = 0;
  double sum = 0;
  bool isSelectedAll = true;

  BottomOperationBar(this.num, this.sum, this.isSelectedAll);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(140),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCheckAllBtn(context),
          Expanded(child: _buildSum(sum)),
          _buildCountBtn(context, num)
        ],
      ),
    );
  }

  Widget _buildCheckAllBtn(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Colors.red,
          value: isSelectedAll,
          onChanged: (value) {
            Provide.value<CartProvide>(context).toggleSelectAll();
          },
        ),
        Text(
          '全选',
        )
      ],
    ));
  }

  Widget _buildSum(double sum) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(180),
                child: Text(
                  '合计：',
                  maxLines: 1,
                  style: TextStyle(fontSize: ScreenUtil().setSp(32)),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: ScreenUtil().setWidth(140),
                  child: Text(
                    '￥ $sum',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            '满68元免配送费，预约免配送费',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCountBtn(BuildContext context, int num) {
    return RaisedButton(
        color: Colors.red,
        child: Text(
          '结算($num)',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Fluttertoast.showToast(
              msg: '购买成功！',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.pink,
              textColor: Colors.white,
              fontSize: 16.0);
          Provide.value<CartProvide>(context).clearCart();
        });
  }
}
