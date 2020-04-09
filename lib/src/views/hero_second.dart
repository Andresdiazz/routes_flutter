import 'package:flutter/material.dart';

class SecondHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body:  Hero(
          tag: url,
            child: Image.network(url, fit: BoxFit.contain,)),

    );
  }
}
