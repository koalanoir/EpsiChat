
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EpsiChat"),),
      body: ListView.builder(
        itemCount: 999999999,
        itemBuilder: (context, index)=>ListTile(
          leading: CircleAvatar(child: Text("AB"),
           backgroundColor: Colors.redAccent,),
          title: Row(
            children: [
              Text("Mon pseudo à 12h56"),
              Spacer(),
              Text("à 12h56"),
            ],
          ),
          subtitle: Text("ceci est un message tres long"),

        )
      )
    );
  }
}
