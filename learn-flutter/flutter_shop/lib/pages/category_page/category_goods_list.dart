import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:provide/provide.dart';

class CategoryGoodsListWidget extends StatefulWidget {
  @override
  _CategoryGoodsListWidgetState createState() =>
      _CategoryGoodsListWidgetState();
}

class _CategoryGoodsListWidgetState extends State<CategoryGoodsListWidget>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<_CategoryGoodsListWidgetState> _categoryGoodsListKey =
      GlobalKey<_CategoryGoodsListWidgetState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      child: Provide<CategoryGoodsList>(
        builder: (context, child, categoryGoods) {
          List<CategoryGoods> categoryGoodsList =
              categoryGoods.categoryGoodsList;
          if (categoryGoodsList == null || categoryGoodsList.length == 0) {
            return Center(
              child: Text('分类商品数据没有...'),
            );
          } else {
            return Wrap(
              spacing: 2,
              children: categoryGoodsList
                  .map((categoryGoods) => _buildCategoryGoods(categoryGoods))
                  .toList(),
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryGoods(CategoryGoods categoryGoods) {
    return Container(
      width: ScreenUtil().setWidth(280),
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          String id = categoryGoods.goodsId;
          Provide.value<GoodsDetailProvide>(context).requestGoodsDetailData(id);
          Application.router.navigateTo(context, '/detail?id=$id');
        },
        child: Column(
          children: [
            Image.network(categoryGoods.image),
            Text(
              categoryGoods.goodsName,
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('￥${categoryGoods.presentPrice}'),
                Text(
                  '￥${categoryGoods.oriPrice}',
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

  @override
  bool get wantKeepAlive => true;
}
