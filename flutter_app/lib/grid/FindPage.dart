import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/bean/PicModel.dart';
import 'package:cached_network_image/cached_network_image.dart';


/**
 * @Description:     寻找的界面
 * @Author:          sun
 * @CreateDate:     2019/4/16 10:59
 * @UpdateUser:     sun
 * @UpdateDate:    2019/4/16 10:59
 * @UpdateRemark:   修改内容
 * @Version:        1.0
 * @email           13520335872@163.com
 */
class FindPage extends StatefulWidget{

  FindPage({Key key}):super(key:key);

  /**
   * 创建 返回 state 对象
   */
  @override
  State createState() => _FindPageState();
}

/**
 * @Description:    state状态
 * @Author:          sun
 * @CreateDate:     2019/4/16 11:02
 * @UpdateUser:     sun
 * @UpdateDate:    2019/4/16 11:02
 * @UpdateRemark:   修改内容
 * @Version:        1.0
 * @email           13520335872@163.com
 */
class _FindPageState extends State<FindPage>{

   List<PicModel> picList=List();
   int page=1;

   @override
  void initState() {
    super.initState();
    //获取 图片列表的集合
    _getPicList();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar:AppBar(
         title: Text("美图"),
         centerTitle: true,
       ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
          ),
          itemCount: picList.length,
          itemBuilder: (BuildContext context,int index){
             if(index==picList.length-1){
               //进行获取数据
                _getPicList();
             }
             return buildItem(picList[index]);
          }),
    );
  }

   /**
    * 异步执行方法
    */
  void _getPicList() async{
      //链接
      String url='https://www.apiopen.top/meituApi?page=$page';
      var httpClient=HttpClient();
      try{
        var req=await httpClient.getUrl(Uri.parse(url));
        var res=await req.close();
        //print(res)
        if(res.statusCode==HttpStatus.OK){
             var jsonString=await res.transform(utf8.decoder).join();
             //print(jsonString)
             Map data=jsonDecode(jsonString);
             print(data);
             List pics=data['data'];
             List<PicModel> items=List();
             for(var value in pics) {
                items.add(PicModel.fromJson(value));
             }
             setState(() {
                 this.picList.addAll(items);
                 this.page++;
             });
        }
      }catch(e){
         print(e.toString());
      }
  }

   /**
    * 构建 控件
    * 加入 事件的监听
    */
  Widget buildItem(PicModel item) {

     return GestureDetector(
       onTap: (){
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context)=>
                  Scaffold(
                    appBar: AppBar(
                      title: Text("图片详情"),
                    ),
                    body: Center(
                      child: Container(
                        width: 300,
                        child: CachedNetworkImage(
                            imageUrl: item.url,
                             //适应宽度
                            fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  )
             ));
       },
       child: CachedNetworkImage(
           errorWidget: Icon(Icons.error),
           imageUrl: item.url,
           fadeInDuration: Duration(seconds: 3),
           fadeOutDuration: Duration(seconds: 1),
       ),
     );
  }
}