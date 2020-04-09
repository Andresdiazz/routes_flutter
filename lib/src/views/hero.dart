import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index){
          final url = "https://picsum.photos/id/$index/410/300";
          return InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/second", arguments: url);
            },
            child: Hero(
              tag: url,
              child: Card(
                child: FadeInImage(
                    placeholder:
                    AssetImage("images/loading.gif"),
                    image: NetworkImage(url),
                  fadeInCurve: Curves.decelerate,
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
