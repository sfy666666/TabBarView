import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  List<Widget> _tabs = [
    Tab(
      text: "关注",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "热榜",
    ),
    Tab(
      text: "科技",
    ),
    Tab(
      text: "免费小说",
    ),
    Tab(
      text: "新时代",
    ),
    Tab(
      text: "抗疫",
    ),
    Tab(
      text: "问答",
    ),
    Tab(
      text: "数码",
    ),
    Tab(
      text: "要闻",
    ),
    Tab(
      text: "视频",
    ),
  ];
  List<Widget> _tabBars = [Center(
    child: Text('关注'),
  ),
    Center(
      child: Text('推荐'),
    ),
    Center(
      child: Text('热榜'),
    ),
    Center(
      child: Text('科技'),
    ),
    Center(
      child: Text('免费小说'),
    ),
    Center(
      child: Text('新时代'),
    ),
    Center(
      child: Text('抗疫'),
    ),
    Center(
      child: Text('问答'),
    ),
    Center(
      child: Text('数码'),
    ),
    Center(
      child: Text('要闻'),
    ),
    Center(
      child: Text('视频'),
    ),];

  TabController _tabController;//注意 在TabBar和TabBarView中都需要配置controller

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: this._tabs.length);
    setState(() {
      _tabController.index=1;
    });
    //监听器
    _tabController.addListener(() {
      //点击切换tab的时候执行了一个动画效果，滑动切换的时候是没有的，在这个过程中触发了一次Listener,所以触发了两次addListener方法
      // 解决点击tab执行2次的问题
      if(_tabController.index ==_tabController.animation.value) {
        //实现自定义的功能
        print(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TabBar(
          controller: this._tabController,
          indicatorColor: Colors.redAccent,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          //和文字等宽
          indicatorSize: TabBarIndicatorSize.label,
          tabs: this._tabs,
        ),
      ),
      body: TabBarView(children: this._tabBars,controller: this._tabController,),
    );
  }
}
