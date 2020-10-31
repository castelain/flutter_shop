import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/member_page/custom_list_tile.dart';

class AboutArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 40),
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: [
          CustomListTile(Icons.info_outlined, '关于商城', () {
            print('点击了关于商城...');
          }),
          CustomListTile(Icons.report_problem, '扫码进行投诉', () {
            print('点击了扫码进行投诉...');
          }),
        ],
      ),
    );
  }
}
