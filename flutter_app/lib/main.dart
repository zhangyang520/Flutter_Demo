import 'package:flutter/material.dart';
import 'grid/gridview.dart';
import 'web/column.dart';
import 'web/row.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

//    //定义变量
//    final wordPair=WordPair.random();
    return MaterialApp(
      title: 'startup Name Generator1',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home:Scaffold(
         //appBar: AppBar(
         //  title: Text("startup Name Generator"),),
//         body: Center(
//             child: Text("hello world"),
//             child: Text(wordPair.asPascalCase)
//               child: RandomWords()
//         ),
          // body: _buildSuggestions(),
   //   )
      /**
       * 自定义的MyHomePage
       */
     // home: MyHomePage(title: "zhang大仙 firstFlutter"),

      /**
       * 自定义的随机的字母ListView
       */
//      home: RandomWords(),

      /**
       * girdView 的展示图片 增加点击事件
       */
      home:new Scaffold(
        appBar: new AppBar(
            title: new Text("flutter gridView list")),
//        body:new GridViewPage()
           body: columnViewPage(),
      ),
      routes: <String,WidgetBuilder>{
        "gridView":(BuildContext context)=>GridViewPage(),
        'rowViewPage':(BuildContext context)=> rowViewPage()
      },
    );
  }
}


