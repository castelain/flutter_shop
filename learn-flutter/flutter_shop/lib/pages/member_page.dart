import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/member_page/about_area.dart';
import 'package:flutter_shop/pages/member_page/avatar_area.dart';
import 'package:flutter_shop/pages/member_page/ticket_area.dart';

import 'member_page/my_order.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: Container(
        child: ListView(
          children: [
            AvatarArea(),
            MyOrder(),
            TicketArea(),
            AboutArea(),
          ],
        ),
      ),
    );
  }
}
