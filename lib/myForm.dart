import 'package:flutter/material.dart';
import 'main.dart';
void main() {
  runApp(MaterialApp(
        home: myForm(),
        title: "Новая запись",
      )
    );
}
class myForm extends StatefulWidget {
  @override
  _myFormState createState() => _myFormState();
}

class _myFormState extends State<myForm> {
  TextEditingController fioController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  String dropValue = "Tovar1";
  String dropValue1 = "Выбор срочности";

  List<String> data = ["fio", "email", "address", "tovar", "srochnost"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Заказ")
      ),
      body: Padding(
        padding:EdgeInsets.all(10.0) ,
        child:Column(
          
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child:TextField(
                onSubmitted: (String text){
                  setState(() {
                    data[0] = text;
                  }); 
                },
                decoration: InputDecoration(
                  hintText: "Ф.И.O.",
                  icon: Icon(Icons.person),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(10.0),
              child:TextField(
                onSubmitted: (String text){
                  setState(() {
                    data[1] = text;
                  }); 
                },
                decoration: InputDecoration(
                  hintText: "e-mail",
                  icon: Icon(Icons.email),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child:TextField(
                onSubmitted: (String text){
                  setState(() {
                    data[2] = text;
                  }); 
                },
                decoration: InputDecoration(
                  hintText: "address",
                  icon: Icon(Icons.domain),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: dropValue,
                isExpanded: true,
                underline: Container(
                height: 2,
                color: Colors.blue,
              ),
                items: <String>["Tovar1","Tovar2", "Tovar3", "Tovar4"].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                    }).toList(),

                onChanged: (String newValue){
                  setState(() {
                    dropValue = newValue;
                    data[3] = newValue;
                  });
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: dropValue1,
                isExpanded: true,
                underline: Container(
                height: 2,
                color: Colors.blue,
              ),
                items: <String>["Выбор срочности","срочно", "неважно", "несрочно"].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                    }).toList(),

                onChanged: (String newValue){
                  setState(() {
                    dropValue1 = newValue;
                    data[4] = newValue;
                  });
                }
              ),
            ),
            OutlineButton(
              child: Text("Подтвердить"),
              onPressed: (){
                setState(() {
                  showDialog<void>(
                    context:context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Вы уверены, что хотите отправить данные?"),
                        content: SingleChildScrollView(
                          child: ListBody(
                              children: [
                                Text("DATA: $data"),
                                Text("Если данные не совпадают, попробуйте зайти в каждый input и нажать enter "),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              child: Text("OK"),
                              onPressed: (){
                                data = data; //типо я дохера умный и тут что-то с данными делаю
                                Navigator.of(context).pop();
                              }, 
                            ),
                            TextButton(
                              child: Text("НЕТ"),
                              onPressed: (){
                                Navigator.of(context).pop();
                              }, 
                            )
                          ],
                        );
                      }
                    );
                  }
                );
              }
            )
          ],
        )
      ),
    );
  }
}

// Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));