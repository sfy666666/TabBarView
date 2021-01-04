import 'package:flutter/material.dart';
import 'package:newsscaffold/pages/tabs/Ixigua.dart';
import 'package:newsscaffold/pages/tabs/User.dart';
import 'package:newsscaffold/pages/tabs/VideoHall.dart';

import 'tabs/Home.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key,this.index=0}):super(key:key);
  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  _TabsState(index){
    this._currentIndex=index;
  }
  int _currentIndex ;
  List _pageList = [HomePage(), IxiguaPage(), VideoHallPage(),UserPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text("今日头条"),
//      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          //图标大小
          iconSize: 35,
          //选中颜色
          fixedColor: Colors.redAccent,
          //底部可以设置多个按钮
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(Icons.play_arrow), title: Text("西瓜视频")),
            BottomNavigationBarItem(icon: Icon(Icons.slideshow), title: Text("放映厅")),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("我的")),
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
