import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  IconData icon;
  String title;
  Function tapHandler;

  CustomListTile(this.icon, this.title, this.tapHandler);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapHandler,
      child: Container(
        width: ScreenUtil().setWidth(750),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black12,
          width: 0.8,
        ))),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
