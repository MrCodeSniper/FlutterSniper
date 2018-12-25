import 'package:flutter/material.dart';

//热重载需要app已经启动 skia会解析dart 并重新渲染ui
//一个app可以是一个插件
void main() => runApp(MyApp());


/**
 * 在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)。
 * Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面
 * （通常是通过组合、拼装其它基础widget）。------也就是说 build 就是 类似 H5和XML的地方
 *
 *
 * 无状态 StatelessWidget  状态 StatefulWidget
 *
 *Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，而Stateless widget是不可变的
 *
 *
 *
 *setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面
 *
 *
 *
 * 构建UI界面的逻辑在build方法中
 *
 *
 * 当初始化完成后，Flutter框架会调用Widget的build方法来构建widget树，最终将widget树渲染到设备屏幕上
 *
 *
 * ui-widget:
 *  Center widget，Center 可以将其子widget树对其到屏幕中心
 *  Column widget，Column的作用是将其所有子widget沿屏幕垂直方向依次排列 以此类推 row 就是水平
 *
 *
 */







//无状态插件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo', //应用描述
      theme: ThemeData(
        //主题配置
        primarySwatch: Colors.red,
      ),
      //应用首页路由 类似vue  home的视图插件为Myhomepage
      home: MyHomePage(title: '陈鸿的flutterDemo'),
    );
  }
}

//有状态的插件
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  //必须包含变化的状态
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//build视图 为什么要抽出来 访问方便 多个build隔离 不应该将子类的逻辑跟父类强耦合



class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;//计数变量

  //执行这个方法会设置状态 达到刷新的效果
  void _incrementCounter() {
    setState(() { //重新构建ui 类似android的invalideD
      _counter++;
    });
  }

  //setstate回调 这里类似h5拼接视图代码
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold 是Material库中提供的页面模板，它包含导航栏和Body以及FloatingActionButton。
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //对齐方式
          children: <Widget>[
            Text(
              '按一下按钮计数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display3, //display 1 2 3 逐渐字体变大
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, //接受一个回调函数
        tooltip: 'Increment',
        child: Icon(Icons.add_box), //默认图标
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
