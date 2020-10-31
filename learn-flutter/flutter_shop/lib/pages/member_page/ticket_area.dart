import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/member_page/custom_list_tile.dart';

class TicketArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: [
          CustomListTile(Icons.sticky_note_2_outlined, '领取优惠券', () {
            print('点击了领取优惠券...');
          }),
          CustomListTile(Icons.gavel, '已领取优惠券', () {
            print('点击了已领取优惠券...');
          }),
          CustomListTile(Icons.add_location_rounded, '地址管理', () {
            print('点击了地址管理...');
          }),
        ],
      ),
    );
  }
}
