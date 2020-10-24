import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  String imgSrc;
  AdBanner(this.imgSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(imgSrc),
    );
  }
}
