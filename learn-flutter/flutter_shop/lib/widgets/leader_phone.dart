import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 拨打电话区域
class LeaderPhone extends StatelessWidget {
  String phoneNumber;
  String leaderImgSrc;

  LeaderPhone(this.phoneNumber, this.leaderImgSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchUrl,
        child: Image.network(leaderImgSrc),
      ),
    );
  }

  void _launchUrl() async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw '拨打电话出错了...';
    }
  }
}
