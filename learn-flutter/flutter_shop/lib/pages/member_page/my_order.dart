import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(260),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: Column(
        children: [
          _buildTitle(),
          Expanded(
            child: _buildItems(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return InkWell(
      onTap: () {
        print('点击了我的订单...');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12, width: 0.8),
          ),
        ),
        child: ListTile(
          leading: Icon(Icons.insert_drive_file),
          title: Text('我的订单'),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }

  Widget _buildItem(Function tapHandler, IconData icon, String title) {
    return InkWell(
      onTap: tapHandler,
      child: Container(
        width: ScreenUtil().setWidth(187),
        alignment: Alignment.center,
        padding: EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Icon(
                icon,
                color: Colors.black45,
                size: 30,
              ),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }

  Widget _buildItems() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildItem(() {
          print('点击了待付款...');
        }, Icons.payment, '待付款'),
        _buildItem(() {
          print('点击了待发货...');
        }, Icons.loop, '待发货'),
        _buildItem(() {
          print('点击了待收货...');
        }, Icons.directions_car, '待收货'),
        _buildItem(() {
          print('点击了待评价...');
        }, Icons.edit, '待评价'),
      ],
    );
  }
}
