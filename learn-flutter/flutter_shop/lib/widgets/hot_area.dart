import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/service_method.dart';

GlobalKey<_HotAreaState> hotAreaKey = GlobalKey<_HotAreaState>();

class HotArea extends StatefulWidget {
  HotArea({Key key}) : super(key: key);

  @override
  _HotAreaState createState() => _HotAreaState();
}

class _HotAreaState extends State<HotArea> {
  int page;
  List hotItems = [];

  @override
  void initState() {
    super.initState();
    page = 1;
    _getHotItems(page: 1);
  }

  // 获取火爆专区数据
  void _getHotItems({int page}) {
    var data = {'page': page};
    request('hotAreaPath', formData: data).then((val) {
      // 如果组件还没有挂载，就返回，不进行 setState
      if (!mounted) {
        return;
      }
      setState(() {
        hotItems = jsonDecode(val)['data'];
        page++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [HotAreaTitle(), HotAreaContent(hotItems)],
      ),
    );
  }
}

class HotAreaTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ScreenUtil().setWidth(50),
              margin: const EdgeInsets.only(right: 6),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text('火'),
              ),
            ),
            Text(
              '火爆专区',
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ));
  }
}

// ignore: must_be_immutable
class HotAreaContent extends StatelessWidget {
  List items;

  HotAreaContent(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // padding: const EdgeInsets.all(10),
      child: Wrap(
        children: _buildHotAreaItemList(),
      ),
    );
  }

  Widget _buildHotAreaItem(Map item) {
    return Container(
      width: ScreenUtil().setWidth(375),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          print('点击了火爆专区物品: ${item['name']}');
        },
        child: Column(
          children: [
            Image.network(item['image']),
            Text(
              item['name'],
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('￥${item['mallPrice']}'),
                Text(
                  '￥${item['price']}',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black26),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildHotAreaItemList() {
    if (!(items == null) && items.length > 0) {
      return items.map((item) {
        return _buildHotAreaItem(item);
      }).toList();
    } else {
      return [Text('')];
    }
  }
}
