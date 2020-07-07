//新しいdartファイル作ったらmaterial.dartをimport import 'maででてくる（MaterialApp使っている場合）
import 'package:flutter/material.dart';

//stうつだけ stateful widget
class HomeScreen extends StatefulWidget {
  //class名にMaterialApp内のhomeプロパティで指定したメソッド名を入力
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _textHeader = "あなたの名前を教えてください。"; //Stringの場合コンストラクタでクラス名を入れなくても良い
  TextEditingController _textEditingController =
      TextEditingController(); //変数はクラスの名前を小文字にするのが慣例
  Widget _imageWidget = Container(); //型に困ったらWidget, imageについてはContainerクラス

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //return値をContainerからMaterialAppを使っている場合はScaffoldを使うとマテリアルデザインの機能(appBarプロパティとか)そのまま使える
      appBar: AppBar(
        //appBarプロパティにAppBarインスタンスをセット
        title: Text('はじめてのアプリ'), //クラス=>プロパティ：クラス設定=>プロパティの繰り返し
        centerTitle: true,
      ),
      body: Container(
        //余白作りたい->Colum全体をContainerで包みpadding指定 option+enter->Wrap with Container
        padding: EdgeInsets.all(20.0),
        //EdgeInsets.allは端っこ全てに余白を入れる only(left:20.0, top:14.0)などそれぞれに指定
        child: Column(
          //body部分はColumnクラスで縦に４つのwidgetを並べていく
          children: <Widget>[
            //Columnクラスの中にchildrenプロパティにWidgetを入れていく
            Center(
              //Textにoption+Enterして、Wrap with Center選択する
              child: Text(_textHeader, style: TextStyle(fontSize: 15.0)),
            ),
            //TextStyleクラスにフォントやカラープロパティがある
            TextField(
              //文字入力できる場所
              keyboardType: TextInputType.text, //出てくるキーボードのタイプを選択する
              style: TextStyle(fontSize: 18.0),
              controller:
                  _textEditingController, // 入力した文字を管理するTextEditingControllerをあとで設定
            ),
            Expanded(child: _imageWidget),
            //プロジェクトに取り込んでる画像を使う場合はImage.asset(パス)
            //画像の幅を広げたい=>Image.assetをWrap with Widget=>Expanded
            //初めは画像出さないのでContainer
            SizedBox(
              //ボタンを横幅いっぱいに伸ばしたい=>wrap with widget->SizedBoxでwidth
              width: double.infinity, //横幅無限大=>Columnの子ども=>Containedのこども

              child: RaisedButton(
                  onPressed: () => _onClick(), //ボタンのクリック処理
                  //無名関数を入力し、_onClickの上でoption+enter=>クラス内で使うのでメソッドを選択
                  child: Text(
                    "おしてね",
                    style: TextStyle(fontSize: 25.0),
                  )), //盛り上がってるボタン
            ),
          ],
        ),
      ),
    );
  }

  _onClick() {
    setState(() {
      //文字
      var inputText = _textEditingController
          .text; //Textfieldで入力した文字を変数へ格納、メソッド内での変数宣言はvarのみ
      _textHeader = "こんにちは!$inputTextさん"; //文字列中の変数は$変数記載のみで良い
      //画像
//      _imageWidget = Image.asset("assets/images/hello.png");
    _imageWidget = Image.network('https://d1f5hsy4d47upe.cloudfront.net/46/4642f93a2e7f1b0c7aae8590851ff244_w.jpg');
    //外から取ってくるのはImage.network(src)を使う
    });
  }
}
