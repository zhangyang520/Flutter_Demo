import 'package:flutter/material.dart';
import 'package:flutter_app/grid/gridview.dart';
import  'package:flutter/services.dart';
/**
 * 列布局的例子
 */
class columnViewPage extends StatefulWidget{

  /**
   * 创建状态实例
   */
  @override
  State<StatefulWidget> createState()=> columnViewState();
}

/**
 * 列布局的 状态类
 */
class columnViewState extends State<columnViewPage>{

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {

    /**
     * 标题布局
     */
    Widget titleSection=new Container(
       padding: const EdgeInsets.all(32.0),
       //整体是行布局
       child: new Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children:[
           //这边 必须使用 expanded 控件 默认横向 横向占比 需要与 下面的布局分开
             new Expanded(
                 //列布局
                 child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                       //容器布局
                       new Container(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                              'Oeschinen Lake Campground',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                              ),),
                       ),
                      new Text(
                        'Kandersteg, Switzerland',
                        style: new TextStyle(
                           color: Colors.grey[500]
                        ),
                      )
                    ],
                 )),
               new Icon(
                 Icons.star,
                 color: Colors.red[500],
               ),
               new Text("41"),
         ],
       ),
    );

    //设置 title 的点击事件
    var titleGestureDetector=GestureDetector(
      child:titleSection ,
      onTap: (){
          Navigator.of(context).pushNamed("findPage");
      },
    );

    /**
     * 按钮的布局
     */
    Widget buttonSection=new Container(
      child: new Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE")
        ],
      ),
    );

    /**
     * 文本的部分 
     */
     Widget textSection=new Container(
       padding: const EdgeInsets.all(32.0),
       child: new Text(
           "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, "
               "it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a "
               "half-hour walk through pastures and pine forest, leads you to the lake, "
               "which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, "
               "and riding the summer toboggan run."
          ,softWrap: true,
       ),
     );
    GestureDetector textGestureDetector=new GestureDetector(
      child: textSection,
      onTap: (){
          Navigator.of(context).pushNamed("rowViewPage");
      },
    );

    /**
     * 图片的部分
     */
    Image image=new Image.asset(
      'images/lake.jpg',
      width:600.0,
      height:240.0,
      fit:BoxFit.cover,
    );
    //增加 点击事件
    GestureDetector gestureDetector=GestureDetector(
       child:image ,
       onTap:(){
         Navigator.of(context).pushNamed("gridView");
       },
    );


    ListView listView=new ListView(
       children: <Widget>[
         gestureDetector,
         titleGestureDetector,
         buttonSection,
         textGestureDetector
       ],
    );
    return listView;
  }

  /**
   * 构建 按钮的列
   */
  Widget buildButtonColumn(IconData icon,String label) {
        //基础颜色
        Color color=Theme.of(context).primaryColor;

        //返回列
        return new Column(

           //大小
           mainAxisSize: MainAxisSize.min,
           //坐标的居中
           mainAxisAlignment: MainAxisAlignment.center,
           //子布局
           children: <Widget>[
             //图标
             new Icon(icon,color:color),
             //容器
             new Container(
                margin: const EdgeInsets.only(top:8.0),
                child: new Text(
                  label,
                  style: new TextStyle(
                     fontSize: 12.0,
                     fontWeight: FontWeight.w400,
                     color: color
                  ),
                ),
             )
           ],
        );
  }
}

