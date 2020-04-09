import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  final _scaffKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    SecondPageArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffKey,
      drawer: _getDrawer(context),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(arguments.name),
            Text(arguments.lastname),
            FlatButton(
                onPressed: (){
                  _showDialog(context);
                },
                child: Text("Mostrar"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _scaffKey.currentState.openDrawer(),
        child: Icon(Icons.menu),
      ),
    );

  }

  void _showSnackBar() {
    SnackBar snackBar = SnackBar(
        content: Text("Texto Eliminado"),
      action: SnackBarAction(label: "Cancelar", onPressed: (){
        print("Cancelar");
      }),
    );
    _scaffKey.currentState.showSnackBar(snackBar);

  }

  void _showDialog(BuildContext context){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("Pregunta"),
          content: Text("Seguro desea eliminar"),
          actions: <Widget>[
            FlatButton(onPressed: (){

            }, child: Text("Si")),
            FlatButton(onPressed: (){

            }, child: Text("No"))
          ],
          
        );
    /*SimpleDialog(
          title: Text("Seleccione"),
          children: <Widget>[
            ListTile(
              title: Text("Eliminar"),
              leading: Icon(Icons.delete),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Editar"),
              leading: Icon(Icons.edit),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],

        );*/
      },
       // barrierDismissible: false
      );
  }



  Widget _getDrawer(BuildContext context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          /*DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlutterLogo(size: 100,),
                Text("Uso de Drawer",
                style: TextStyle(
                  color: Colors.white
                ),)
              ],
            ),
          ),*/
          UserAccountsDrawerHeader(
            accountEmail: Text("andres@gmail.com"),
            accountName: Text("Andres Diaz"),
            currentAccountPicture: FlutterLogo(),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.white
              ],
                end: Alignment.topLeft
              )
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () => showHome(context),
          )
        ],
      ),
    );
  }

  void showHome(BuildContext context){
    Navigator.pop(context);

    Navigator.of(context).pushNamed("/");
  }



}

class SecondPageArguments {
  String name;
  String lastname;
  SecondPageArguments({this.name, this.lastname});
}

