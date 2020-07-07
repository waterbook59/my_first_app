import 'package:flutter/material.dart';

import 'screens/home_screen.dart';//HomeScreenのクイック修正で自動で追加

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {//stと打つと出てくるので、class名を記入
  @override
  Widget build(BuildContext context){//buildメソッドはお絵かきメソッドでMaterialApp(マテリアルデザインを記述できるメソッド)を書いている
    return MaterialApp(//アプリ全体に関わるクラスはMaterialApp/CupetinoApp、Container
      title:"はじめてのアプリ",
      theme: ThemeData.dark(),//アプリ全体をダークテーマにしたい時
      debugShowCheckedModeBanner: false,//デバックバナー消したい時
      home: HomeScreen(),//option+enterでhome_screen.dartをimport
    );
  }
}
