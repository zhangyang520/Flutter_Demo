import 'package:flutter/material.dart';
import 'package:flutter_drag_scale/flutter_drag_scale.dart';


/**
 *  girdView 中的 StagefulWidget
 */
class GridViewPage extends StatefulWidget{

  /**
   * 返回 状态的 GridViewState
   */
  @override
  State<StatefulWidget> createState() =>GridViewState();
}

/**
 * GridView 的State
 */
class GridViewState extends State<GridViewPage>{

  GridViewState(){

  }
  List<String> urlList=new List();

  @override
  void initState() {
    super.initState();
    String url1 =
        "https://tp.85814.com/d/file/shutu/2018-05/20150228090538519.jpg";
    String url2=
        "https://tp.85814.com/d/file/shutu/2018-05/20150228090540904.jpg";
    String url3=
        "https://tp.85814.com/d/file/shutu/2018-05/nv_6.jpg";
    String url4=
        "https://tp.85814.com/d/file/shutu/2018-05/nv_1.jpg";
    String url5=
        "https://tp.85814.com/d/file/shutu/2018-05/nv_2.jpg";
    String url6=
        "https://tp.85814.com/d/file/shutu/2018-05/nv_3.jpg";
    String url7=
        "https://tp.85814.com/d/file/shutu/2018-05/20150228090546364.jpg";
    String url8=
        "https://tp.85814.com/d/file/shutu/2018-05/20150228090547997.jpg";
    String url9=
        "https://tp.85814.com/d/file/shutu/2018-05/nv_5.jpg";
    urlList.add(url1);
    urlList.add(url2);
    urlList.add(url3);
    urlList.add(url4);
    urlList.add(url5);
    urlList.add(url6);
    urlList.add(url7);
    urlList.add(url8);
    urlList.add(url9);
  }


  @override
  Widget build(BuildContext context) =>
      new Scaffold(
            appBar: new AppBar(
              title: new Text("gridView title appbar"),

            ),
            body: new GridView.count(
                primary: true,
                padding: const EdgeInsets.all(8.0),
                mainAxisSpacing: 8.0, //竖向间距
                crossAxisCount: 2, //横向的item的个数
                crossAxisSpacing: 8.0, //横向的间距
                children: buildGridTitleList(9))
        );

  /**
   * new MaterialApp(
      title: "gridView title",
      theme: ThemeData(
      primarySwatch: Colors.blue
      ),
      home:Scaffold(
      appBar: new AppBar(
      title: new Text("gridView title appbar"),

      ),
      body: new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(8.0),
      mainAxisSpacing: 8.0, //竖向间距
      crossAxisCount: 2, //横向的item的个数
      crossAxisSpacing: 8.0, //横向的间距
      children: buildGridTitleList(9))
      )
      );
   */


  /**
   * 创建 集合的小部件
   */
  List<Widget> buildGridTitleList(int number) {
    List<Widget> widgetList=List();
    //循环遍历
    for(int i=0;i<number;++i){
      widgetList.add(getItemWidget(i));
    }
    return widgetList;
  }


  /**
   * 创建 条目
   */
  Widget getItemWidget(final int index) {
    return new GestureDetector(
      onTap:(){
        showDialog(
            context: context,
            builder: (BuildContext buildContext){
              return showImageDialog(urlList.elementAt(index));
            }
        );
      },
      child: Image(image:new NetworkImage(urlList.elementAt(index)),fit:BoxFit.cover),
    );
  }

  /**
   * 展示 图片的对话框
   */
  Widget showImageDialog(String imageUrl){

    //直接返回一个 对话框
//      return new AlertDialog(
//         title: new Text("美女大图"),
//         content:new Image(
//             image:new NetworkImage(imageUrl),
//             fit:BoxFit.cover,
//             height: 1000,
//             width: 1000)
//      );

      return new Container(
        height: 200,
        width: 400,
        child: Scaffold(
            appBar: new AppBar(
               backgroundColor: Colors.black, //导航栏和状态栏的的颜色
               toolbarOpacity:1,
            ),
            body:  Center(
              child: DragScaleContainer(
                  doubleTapStillScale: true,
                  child: new Image(
                    image:new NetworkImage(imageUrl),
                    fit:BoxFit.cover,
                  ) ),
            ),
        )
      );

  }
}