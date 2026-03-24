import 'dart:convert';

class BannerItem{
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  //扩展工厂函数 一般用factory来声明 一般用来创建实例对象
  factory BannerItem.formJSON(Map<String,dynamic> json){
    //必须返回一个BannerItem对象
    return BannerItem(
    id: json["id"]?? "", 
    imgUrl: json["imgUrl"]?? "");
  }
}

//每一个轮播图具体类型
//flutter 必须强制转化,没有隐私转化