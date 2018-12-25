
//可选参数
String tes(String s1,String s2,[String s3]){
  var result="$s1 to $s2";
  if(s3!=null) result = "$result to $s3";
  return result;
}

void execute(var callback){
  callback();
}


typedef bool CALLBACK();


bool isNoble(int atomicNumber){
  return true;
}


void test(CALLBACK cb){
  print(cb());
}


void main() {
  //类似js和kotlin的
  var t;
  //不同是dart是强类型的 编译时按照第一次数据类型判断他的类型
  t = 'hello world';
  t = 1000;
  print(t);
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }

  //dynamic可以转换类型

  dynamic obj1;

  obj1 = 'xxx';

  obj1 = 1000;

  print(obj1);

  //Object是所有对象的基类  任何类型的数据都可以赋值给object声明的对象

  Object obj2 = 2;
  print(obj2);


  final str = '常量';
  const sr1 = '常量';

  //类似js 函数也是对象  可以当做参数传递 可以赋值给变量




  print(isNoble(1));



  //函数作为变量
  var say=(str){
    print(str);
  };

  say('flutter');


  //函数体当做参数
  execute(()=> print('xxx'));

  print(tes("我","是"));


  print(tes("我","是","谁"));

  //延迟两S 返回数据 then拿到异步结果 并打印结果 执行失败进入exception语句 then语句有onError参数可以捕获异常
  Future.delayed(new Duration(seconds: 2),(){
    return "xxxfff";
  }).then((data){
    print(data);
  },onError:(e){
    print(e);
  }).catchError((e){
    print(e);
  }).whenComplete((){
    //无论执行成功或者失败都会走这里
  });

  // 一个界面有多个接口 操作需要等所有接口完成 做处理
  Future.wait([
    Future.delayed(new Duration(seconds: 2),(){
      return "hello";
    }),
    //
    Future.delayed(new Duration(seconds: 4),(){
      return "world";
    })
  ]).then ((results){
    print(results[0]+results[1]);//得到的结果为一个数组 字符串拼接
  });


  //--------------------------------------END CODE--------------------------------------

}