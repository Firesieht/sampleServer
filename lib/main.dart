import 'package:flutter/material.dart';
import 'server.dart';
void main() {
  runApp(MaterialApp(
        home: MyApp(),
        title: "Новая запись",
      )
    );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
class _MyApp extends State<MyApp> {
    String hint = "hint";
    final myController = TextEditingController();
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Новый заказ"),
        ),
        body:Center(
          child: Row(
          children:<Widget>[
            Text("dgdhf"),
            Container(
              child: TextField(
                    onChanged: (String text){
                          String newText =  FutureBuilder(
                                future: myServer(text, "search"),
                                builder: (context, snapshot) {
                                  return  snapshot.data ?? '';}
                              ).toStringShort();
                              
                              myController.text = newText;
                            },
                    controller: myController,
                    decoration:InputDecoration(
                      border: InputBorder.none,
                      hintText: "Введите имя"
                    ),
                  ), 
                  width: 200, 
                  height: 200
                )
        ],)
        )
      );
    }
}
