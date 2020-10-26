import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/goods_detail.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';

class GoodsComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<GoodsDetailProvide>(
      builder: (context, child, data) {
        List<GoodsComment> comments = data.goodsDetailData.goodsComment;
        AdvertesPicture advertesPicture = data.goodsDetailData.advertesPicture;
        if (comments == null || advertesPicture == null) {
          return Center(
            child: Text('数据加载中...'),
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildCommentList(comments),
              _buldAdImage(advertesPicture.pICTUREADDRESS),
            ],
          );
        }
      },
    ));
  }

  Widget _buldAdImage(String img) {
    return Image.network(img);
  }

  Widget _buildCommentList(List<GoodsComment> list) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(200),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _buildComment(list[index]);
          }),
    );
  }

  Widget _buildComment(GoodsComment comment) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.8,
        color: Colors.black12,
      ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${comment.userName}',
            style: TextStyle(
              color: Colors.black38,
              fontSize: ScreenUtil().setSp(36),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              '${comment.comments}',
            ),
          ),
          Text(
            '${DateTime.fromMillisecondsSinceEpoch(comment.discussTime).toLocal()}',
            style: TextStyle(
              color: Colors.black26,
              fontSize: ScreenUtil().setSp(24),
            ),
          )
        ],
      ),
    );
  }
}
