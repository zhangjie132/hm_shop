import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  //分类列表
  List<CategoryItem> categoryList = [];
  //构造函数
  HmCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categoryList.length,
          itemBuilder: (BuildContext context, int index){
            //获取分类列表中的数据
            CategoryItem categoryItem = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            height: 100,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 205, 206, 206),
              borderRadius: BorderRadius.circular(40),
            ),  
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(categoryItem.picture,height: 50,width: 50,fit: BoxFit.cover,),
                SizedBox(height: 5,),
                Text(categoryItem.name,style: TextStyle(color: Colors.black),),
              ],
            ),
          );
        }),
      );
  }
}