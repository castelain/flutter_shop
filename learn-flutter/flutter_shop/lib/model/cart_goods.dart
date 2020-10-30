class CartGoodsModel {
  String goodsId;
  String goodsName;
  int count;
  double price;
  String image;
  bool isChecked; // 标识商品是否被选中

  CartGoodsModel(
      {this.goodsId,
      this.goodsName,
      this.count,
      this.price,
      this.image,
      this.isChecked});

  CartGoodsModel.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    count = json['count'];
    price = json['price'];
    image = json['image'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['count'] = this.count;
    data['price'] = this.price;
    data['image'] = this.image;
    data['isChecked'] = this.isChecked;
    return data;
  }
}
