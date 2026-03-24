import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  HmSlider({Key? key,required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  CarouselSliderController _controller = CarouselSliderController();//控制轮播图的控制器
  int _currentIndex = 0;

  //返回搜索框
  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white,fontSize: 16),
          ),
        ),
        ));

  }
  Widget _getSlider(){
    //在flutter获取屏幕宽度的方法
    // final double screenWidth = MediaQuery.of(context).size.width;//屏幕宽度
    //返回轮播图插件
    //根据数据渲染不同的轮播选项
    return CarouselSlider(
      carouselController: _controller,//绑定controller对象
      items: List.generate(widget.bannerList.length, 
    (int index){
      return Image.network(widget.bannerList[index].imgUrl, fit: BoxFit.cover,width: 350,);
    }), options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      onPageChanged: (index, reason) {
        _currentIndex = index;
        setState(() {});
      },
      ));
  }
  //返回指示灯导航
  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,//主轴居中
          children: List.generate(widget.bannerList.length, (int index){
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
              height: 6,
              width: index == _currentIndex? 40 : 20,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: index == _currentIndex? const Color.fromARGB(255, 67, 54, 244) : Colors.black87,
                borderRadius: BorderRadius.circular(3)
              ),
            ),
            );
          }),
        ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    //Stack -> 轮播图 搜索框 指示灯导航
    return Stack(
      children: [_getSlider(),_getSearch(),_getDots()],
    );
    // return Container(
    //   height: 300,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //    child: Text('轮播图',style: TextStyle(color: Colors.white,fontSize: 20)),
    // );
  }
}