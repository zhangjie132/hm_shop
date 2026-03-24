import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [

    // BannerItem(id: "1", 
    // imgUrl: "https://s1.aigei.com/src/img/png/73/7335ae607bd548fcbbbfe8c392c9e2d3.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:gCOeTYvH6M5ymGgZWwLBb02yUJw="
    // ),
    // BannerItem(id: "2", 
    // imgUrl: "https://s1.aigei.com/src/img/png/b4/b47463394b724903bdfe063bf6862506.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:5xC0Xzq39NPvFZIC05Q1-Ofd1sw="
    // ),
    // BannerItem(id: "3", 
    // imgUrl: "https://s1.aigei.com/src/img/png/3a/3a9e00ef08124bf5b412778f4abee003.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:LhttjqZntsCZ6d-ugkfhbHN3R64="
    // )
  ];
//   https://s1.aigei.com/src/img/png/73/7335ae607bd548fcbbbfe8c392c9e2d3.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:gCOeTYvH6M5ymGgZWwLBb02yUJw=

// https://s1.aigei.com/src/img/png/b4/b47463394b724903bdfe063bf6862506.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:5xC0Xzq39NPvFZIC05Q1-Ofd1sw=

// https://s1.aigei.com/src/img/png/3a/3a9e00ef08124bf5b412778f4abee003.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:LhttjqZntsCZ6d-ugkfhbHN3R64=

  List<Widget> _getScrollChildren (){
    return [
      //包裹普通widget的sliver
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),//轮播图组件
      //放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory()),//分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion()),//推荐组件
      //SliverGrid 和 SliverList 只能纵向排列
      //ListView
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: 
      Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: HmHot()),
          SizedBox(width: 10),
          Expanded(child: HmHot())
        ],
        ),
      ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList()//无限滚动列表
    ];
  }
  @override
  void initState() { 
    super.initState();
    _getBannderList();
  }

  void _getBannderList()async{
   _bannerList = (await getBannerListAPI()).cast<BannerItem>();
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren(),);//Sliver家族的内容
  }
}