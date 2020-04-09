import 'package:flutter/material.dart';
import 'package:routesapp/src/views/second_page.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController nameTextController;

  TextEditingController lastNameTextController;


  String nameValue;
  String lastNameValue;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homa Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formkey,
          child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nombre",
              ),
              controller: nameTextController,
              onSaved: (value){
                nameValue = value;
              },
              validator: (value){
                if(value.isEmpty){
                  return "Llene este campo";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Apellido"
              ),
              controller: lastNameTextController,
              onSaved: (value){
                lastNameValue = value;
              },
              validator: (value){
                if(value.isEmpty){
                  return "Llene este campo";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Telefono"
              ),
              keyboardType: TextInputType.phone,
            ),
            Center(
              child: RaisedButton(
                  child: Text("Second Page"),
                  onPressed: (){
                    _onPressed(context);
                  }),
            ),
          ],
        ),
        )
      ),
    );
  }

  void _onPressed(BuildContext context) {
    /*final route = MaterialPageRoute(builder: (BuildContext context){
      return SecondPage(name: "Andres",);
    });
    Navigator.of(context).push(route);*/

    if(formkey.currentState.validate()){
      formkey.currentState.save();
      Navigator.of(context).pushNamed("/second", arguments: SecondPageArguments(name: this.nameValue, lastname: this.lastNameValue) );
    }


  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameTextController = TextEditingController();
    lastNameTextController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameTextController.dispose();
    lastNameTextController.dispose();
  }
}


