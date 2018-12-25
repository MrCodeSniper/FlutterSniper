import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;


//加载assets资源
Future<String> loadAssets() async{
  return await rootBundle.loadString("images/config.json");
}

class ImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage('images/logo.png'))
      ),
    );
  }
}


//快速图片插件
class QuickImageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Image.asset("images/logo.png");
  }





}