class GoodsDetailModel {
  String code;
  String message;
  GoodsDetailData data;

  GoodsDetailModel({this.code, this.message, this.data});

  GoodsDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? new GoodsDetailData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class GoodsDetailData {
  GoodsInfo goodInfo;
  List<GoodsComment> goodsComment;
  AdvertesPicture advertesPicture;

  GoodsDetailData({this.goodInfo, this.goodsComment, this.advertesPicture});

  GoodsDetailData.fromJson(Map<String, dynamic> json) {
    goodInfo = json['goodInfo'] != null
        ? new GoodsInfo.fromJson(json['goodInfo'])
        : null;
    if (json['goodComments'] != null) {
      goodsComment = new List<GoodsComment>();
      json['goodComments'].forEach((v) {
        goodsComment.add(new GoodsComment.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goodInfo != null) {
      data['goodInfo'] = this.goodInfo.toJson();
    }
    if (this.goodsComment != null) {
      data['goodComments'] = this.goodsComment.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    return data;
  }
}

class GoodsInfo {
  String image5;
  int amount;
  String image3;
  String image4;
  String goodsId;
  String isOnline;
  String image1;
  String image2;
  String giftCouponsOffline;
  int tYPESHIP;
  String goodsSerialNumber;
  double oriPrice;
  double presentPrice;
  String comPic;
  int state;
  String shopId;
  String goodsName;
  String goodsDetail;

  GoodsInfo(
      {this.image5,
      this.amount,
      this.image3,
      this.image4,
      this.goodsId,
      this.isOnline,
      this.image1,
      this.image2,
      this.giftCouponsOffline,
      this.tYPESHIP,
      this.goodsSerialNumber,
      this.oriPrice,
      this.presentPrice,
      this.comPic,
      this.state,
      this.shopId,
      this.goodsName,
      this.goodsDetail});

  GoodsInfo.fromJson(Map<String, dynamic> json) {
    image5 = json['image5'];
    amount = json['amount'];
    image3 = json['image3'];
    image4 = json['image4'];
    goodsId = json['goodsId'];
    isOnline = json['isOnline'];
    image1 = json['image1'];
    image2 = json['image2'];
    giftCouponsOffline = json['gift_coupons_offline'];
    tYPESHIP = json['TYPE_SHIP'];
    goodsSerialNumber = json['goodsSerialNumber'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    comPic = json['comPic'];
    state = json['state'];
    shopId = json['shopId'];
    goodsName = json['goodsName'];
    goodsDetail = json['goodsDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image5'] = this.image5;
    data['amount'] = this.amount;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['goodsId'] = this.goodsId;
    data['isOnline'] = this.isOnline;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['gift_coupons_offline'] = this.giftCouponsOffline;
    data['TYPE_SHIP'] = this.tYPESHIP;
    data['goodsSerialNumber'] = this.goodsSerialNumber;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['comPic'] = this.comPic;
    data['state'] = this.state;
    data['shopId'] = this.shopId;
    data['goodsName'] = this.goodsName;
    data['goodsDetail'] = this.goodsDetail;
    return data;
  }
}

class GoodsComment {
  int sCORE;
  String comments;
  String userName;
  int discussTime;

  GoodsComment({this.sCORE, this.comments, this.userName, this.discussTime});

  GoodsComment.fromJson(Map<String, dynamic> json) {
    sCORE = json['SCORE'];
    comments = json['comments'];
    userName = json['userName'];
    discussTime = json['discussTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SCORE'] = this.sCORE;
    data['comments'] = this.comments;
    data['userName'] = this.userName;
    data['discussTime'] = this.discussTime;
    return data;
  }
}

class AdvertesPicture {
  String pICTUREADDRESS;
  String tOPLACE;
  int urlType;

  AdvertesPicture({this.pICTUREADDRESS, this.tOPLACE, this.urlType});

  AdvertesPicture.fromJson(Map<String, dynamic> json) {
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
    tOPLACE = json['TO_PLACE'];
    urlType = json['urlType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    data['TO_PLACE'] = this.tOPLACE;
    data['urlType'] = this.urlType;
    return data;
  }
}
