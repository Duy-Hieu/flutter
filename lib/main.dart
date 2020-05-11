import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Những Con Số May Mắn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numbermax=1;
  int numberrandom=0;
  String mes='';
  List<int> listnumber=[];
  List<int> liststep=[1,5,10,50,100,500,1000,5000,10000,50000,100000,500000,1000000,5000000,10000000];
  List<int> listview=[];
  int indexstep=0;
  int numberstep=1;
  void _increNumberMax(){
    setState((){
      numbermax+=numberstep;
    });
  }
  void _clearListNumber(){
    setState(() {
      listnumber.clear();
      listview.clear();
    });
  }
  void _addNumber(){
    setState(() {
      if(listnumber.length>=numbermax)mes='Đã đủ giới hạn';
      else{
        mes='';
        bool check=false;
        while(!check) {
          check=true;
          numberrandom = Random.secure().nextInt(numbermax) + 1;
          for (int i = 0; i < listnumber.length; i++) {
            if (listnumber[i] == numberrandom) {
              check = false;
              break;
            }
          }
          if (check) listnumber.add(numberrandom);
          listview.clear();

          for(int i=listnumber.length-25>=0?listnumber.length-25:0;i<listnumber.length;i++){
            listview.add(listnumber[i]);
          }
        }
      }
    });
  }
  void _increIndexStep(){
    setState(() {
      indexstep++;
      indexstep=indexstep>liststep.length-1?liststep.length-1:indexstep;
      numberstep=liststep[indexstep];
    });
  }
  void _discountIndexStep(){
    setState(() {
      indexstep--;
      indexstep=indexstep<0?0:indexstep;
      numberstep=liststep[indexstep];
    });
  }
  void _discountNumberMax(){
    setState((){
      numbermax-=numberstep;
      numbermax=numbermax<1?1:numbermax;
      for(int i=0;i<listnumber.length;i++){
        if(listnumber[i]>numbermax){
          listnumber.clear();
          listview.clear();
          break;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(

        child: new Column(children: <Widget>[

          new Text('Số vừa Random',style: new TextStyle(fontSize: 37.0),),
          new Text('$numberrandom',style: new TextStyle(fontSize: 40.0,color:Colors.green),),
          new Text('$mes', style: new TextStyle(fontSize: 30.0,color: Colors.redAccent),),

          new Text('Các Số đã random ra theo thứ tự 25 lần gần nhất: $listview',style: new TextStyle(fontSize: 20.0,color: Colors.green),),

          new Expanded(
              child: new Divider()
          ),

          new Row(
            children: [
              new Expanded(
                child: new MaterialButton(
                  child: new Text("Down",
                    style: new TextStyle(fontSize: 25.0),),
                  onPressed: _discountIndexStep,
                  color: Colors.pink,
                  textColor: Colors.white,
                  padding: new EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 8.0,
                  ),
                ),
              ),

              new Text('$numberstep',style: new TextStyle(fontSize: 50.0),),

              new Expanded(
                child: new MaterialButton(
                  child: new Text("Up",
                    style: new TextStyle(fontSize: 25.0),),
                  onPressed: _increIndexStep,
                  color: Colors.pink,
                  textColor: Colors.white,
                  padding: new EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 8.0,
                  ),
                ),
              ),
            ],
          ),

          new Row(
            children: [
              new Expanded(
                child: new MaterialButton(
                  child: new Text("-",
                    style: new TextStyle(fontSize: 25.0),),
                  onPressed: _discountNumberMax,
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  padding: new EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0,
                  ),
                ),
              ),

              new Text('$numbermax',style: new TextStyle(fontSize: 50.0),),

              new Expanded(
                child: new MaterialButton(
                  child: new Text("+",
                    style: new TextStyle(fontSize: 25.0),),
                  onPressed: _increNumberMax,
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  padding: new EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
            ],
          ),

          new Row(
            children: [
              new Expanded(
                child: new MaterialButton(
                  child: new Text("Random Number",
                    style: new TextStyle(fontSize: 25.0),),
                  onPressed: _addNumber,
                  color: Colors.redAccent,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),

          new Row(
            children: [
              new Expanded(
                child: new MaterialButton(
                  child: new Text("Xóa Tất Cả",
                    style: new TextStyle(fontSize: 25.0),),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  onPressed: _clearListNumber,
                ),
              ),
            ],
          )

        ],),
      ),
    );
  }
}
