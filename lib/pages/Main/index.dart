import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义数据 根据数据进行渲染4个导航
  //一般应用程序的导航是固定的
  final List<Map<String, String>> _tabList = [
    {
    "icon": "lib/assets/2.png",//正常显示图标
    "active_icon": "lib/assets/2_1.png",//激活显示的图标
    "text": "首页"
    },
     {
    "icon": "lib/assets/4.png",//正常显示图标
    "active_icon": "lib/assets/4_1.png",//激活显示的图标
    "text": "分类"
    },
     {
    "icon": "lib/assets/3.png",//正常显示图标
    "active_icon": "lib/assets/3_1.png",//激活显示的图标
    "text": "购物车"
    },
     {
    "icon": "lib/assets/1.png",//正常显示图标
    "active_icon": "lib/assets/1_1.png",//激活显示的图标
    "text": "我的"
    },
  ];
  int _currentIndex = 0;


//返回底部渲染的四个分类
  List<BottomNavigationBarItem> _getTabBarWidget (){
    return List.generate(_tabList.length, (int index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!,width: 30,height: 30),//正常显示图标
        activeIcon: Image.asset(_tabList[index]["active_icon"]!,width: 30,height: 30),//激活显示图标
        label: _tabList[index]["text"]
        );
    });
  }
List<Widget> _getChildren(){
  return [HomeView(),CategoryView(),CartView(),MineView()];
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //避开安全区组件
      body: SafeArea(
        child:IndexedStack(
          index: _currentIndex,
          children: _getChildren(),//放置几个组件
        )
        ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (int index){
          _currentIndex = index;
          setState(() {});
        },
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
      ),
    );
  }
}