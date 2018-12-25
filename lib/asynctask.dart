void main(){

  //异步任务的两种写法


  Future<String> login(String username,String password){

  };

  Future<String> getUserInfo(String userid){

  };

  Future saveUserInfo(String userinfo){

  };


  //callback hell 一层嵌套一层
  login("xxx", "xxx").then((id){
    getUserInfo(id).then((userinfo){
      saveUserInfo(userinfo).then((){ // ignore: argument_type_not_assignable

      });
    });
  });

  //future 返回值调用仍返回future可以进行链式调用 从嵌套 变为线性
  login("xxx","xxx").then((id){
    return getUserInfo(id);
  }).then((userInfo){
    return saveUserInfo(userInfo);
  }).then((e){

  }).catchError((e){

  });


  //异步任务同步写法 await表示函数是异步的 必须等这个任务完成下面的任务才会执行

  task() async{
    String id = await login("xxx", "xxx");
    String userinfo = await getUserInfo(id);
    await saveUserInfo(userinfo);
  }











}