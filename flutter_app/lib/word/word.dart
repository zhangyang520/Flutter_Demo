import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/**
 * 自己定义的 State<RandWords>
 */
class RandomWordsState extends State<RandomWords>{

  //定义数组
  final _suggestions= <WordPair>[];
  //定义字体大小变量
  final _biggerFont=const TextStyle(fontSize: 18.0);


  @override
  Widget build(BuildContext context) {
    //返回 对应的实体
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator1"),
      ),
      body: _buildSuggestions(),
    );
  }


  /**
   * 返回 列表的小部件
   */
  Widget _buildSuggestions(){
    return ListView.builder(
        padding:const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
          if(i.isOdd) return Divider(color:Color.fromARGB(255, 255, 0, 0));

          final index=i~/2;
          if(index>= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  /**
   * 生成行的 小部件 方法
   */
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),);
  }
}

/**
 * 有状态的 小部件
 */
class RandomWords extends StatefulWidget{

  @override
  RandomWordsState createState() => new RandomWordsState();
}