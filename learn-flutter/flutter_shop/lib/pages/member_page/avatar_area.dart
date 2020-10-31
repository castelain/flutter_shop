import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(340),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Colors.lightBlueAccent, Color.fromRGBO(253, 200, 217, 0.6)],
          stops: [0.3, 0.8],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              'https://ftp.bmp.ovh/imgs/2020/10/357138a6ee14b9fe.png',
              width: ScreenUtil().setWidth(120),
              height: ScreenUtil().setHeight(120),
            ),
          ),
          InkWell(
            onTap: () {
              print('点击了注册/登录按钮...');
            },
            child: Container(
              width: ScreenUtil().setWidth(180),
              height: ScreenUtil().setHeight(60),
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.black45,
                    width: 1.2,
                  )),
              child: Text('注册/登录'),
            ),
          )
        ],
      ),
    );
  }
}
