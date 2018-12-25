void main(){



  //Stream可以接受多个异步结果 可用于网络内容下载 文件读写

  Stream.fromFutures([ //接受多个future异步任务处理 按照时间顺序 处理

    Future.delayed(new Duration(seconds: 2),(){
        return "hello 1";
    }),
    Future.delayed(new Duration(seconds: 1),(){
      throw AssertionError("Error");
    }),
    Future.delayed(new Duration(seconds: 3),(){
      return "hello 3";
    }),
    Future.delayed(new Duration(seconds: 4),(){
      return "hello 4";
    })

  ]).listen((data){
    print(data);
  },onError: (e){
    print(e.message);
  },onDone: (){
    print("结束");
  });



















}