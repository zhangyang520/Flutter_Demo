import 'package:flutter/material.dart';
import  'package:flutter/services.dart';
import  'package:flutter_app/util/Adapt.dart';


class rowViewPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>rowViewState();
}


/**
 * rowViewState
 */
class rowViewState extends State<rowViewPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

  }
  @override
  Widget build(BuildContext context) {

//    var forceOrientation = OrientationPlugin.forceOrientation(DeviceOrientation.landscapeLeft);

    /**
     * 返回行的脚手架
     */
//    return new Scaffold(
//      appBar: AppBar(
//        title: new Text("row text"),
//      ),
//      body: Container(
//        padding: const EdgeInsets.all(10.0),
//        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            Image.asset("images/nv_1.jpg",width: 70,height: 100,),
//            Image.asset("images/nv_2.jpg",width: 70,height: 100,),
//            Image.asset("images/nv_3.jpg",width: 70,height: 100,)
//          ],
//        ),
//      ),
//    );

    /**
     * 返回列的脚手架
     */
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text("column text"),
//      ),
//      body:Container(
//        padding: const EdgeInsets.all(32.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            Image.asset("images/nv_1.jpg",width: 105,height: 150,),
//            Image.asset("images/nv_2.jpg",width: 105,height: 150,),
//            Image.asset("images/nv_3.jpg",width: 105,height: 150,)
//          ],
//        ),
//      ),
//    );

    /**
     * 使用center 居中的 布局
     * 同时使用 Expand 布局 根据分配给你的空间 保持 宽高比的情况下 显示 对应的图片的大小
     *
     */
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text("center text"),
//      ),
//      body: Center(
//        child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Expanded(
//                 child: Image.asset("images/nv_4.jpg"),),
//             Expanded(
//                 child:Image.asset("images/nv_5.jpg"),
//                 flex: 2,
//             ),
//             Expanded(
//                child:  Image.asset("images/nv_6.jpg"),
//             )
//           ],
//        ),
//      ),
//    );


    /**
     * 布局 四个星
     */
    var rating=Container(
      padding: EdgeInsets.all(Adapt.px(30)),
      child: Row(
        //主方向的
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                  Icon(Icons.star,color:Colors.green[500]),
                  Icon(Icons.star,color:Colors.green[500]),
                  Icon(Icons.star,color:Colors.green[500]),
                  Icon(Icons.star,color:Colors.grey),
                  Icon(Icons.star,color:Colors.grey),
            ],
          ),
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: "Roboto",
              letterSpacing: 0.5,
              fontSize: Adapt.px(30)
            ),
          )
        ],
      ),
    );


    /**
     * 描述 列表
     */
    var descTextStyle=TextStyle(
       color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: Adapt.px(25),
      height: 2.0,
    );

    /**
     * DefaultTextStyle.merge 可以允许 您创建一个默认的文本样式，该样式会被其他的子节点 继承
     */
    var iconList=DefaultTextStyle.merge(
       style: descTextStyle,
       child: Container(
          padding: EdgeInsets.all(0.0),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
                new Column(
                  children: <Widget>[
                     Icon(Icons.kitchen,color:Colors.green[500]),
                     Text("PREP:"),
                     Text('25 min')
                  ],
                ),
                new Column(
                   children: <Widget>[
                      Icon(Icons.timer,color:Colors.green[500]),
                      Text("COOK:"),
                      Text("1 hr")
                   ],
                ),
               new Column(
                  children: <Widget>[
                     Icon(Icons.restaurant,color:Colors.green[500]),
                     Text("FEEDS:"),
                     Text("4-6")
                  ],
               )
             ],
          ),
       )
    );

    var  titleText=Text(
       "Strawberry Pavlova",
        style: TextStyle(
           fontSize: Adapt.px(40),
           color: Colors.black,
           fontWeight: FontWeight.w800,
           fontFamily: 'Roboto',
           letterSpacing: 0.5,
        ),
    );

    var contentText=Container(
      padding: EdgeInsets.fromLTRB(Adapt.px(10), Adapt.px(20), 0, 0),
      child: Text(
        "Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova.Pavlova features a crisp crust and soft,light inside,topped with fruit and whipped cream .",
        style: TextStyle(
          fontSize: Adapt.px(30),
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
        ),
      ),
    );

    /**
     * 左边的 column
     */
    var leftColumn=new Container(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             titleText,
            contentText,
              rating,
             iconList
          ],
       ),
    );

    var mainImage=Image.asset("images/1.png",height: Adapt.px(800),);

    var allContent=Center(
       child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,0.0),
          child: Card(
            child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                  Expanded(
                    child: leftColumn,
                  ),
                 Expanded(
                   child: mainImage,
                 )
               ],
            ),
          ),
       ),
    );


    return
      Scaffold(
        appBar: AppBar(
           title: Text("buju center"),
        ),
        body: allContent,
      );
  }
}