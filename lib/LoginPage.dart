import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'ConstStorage.dart';
import 'Home_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //TODO Créer les controller text
  TextEditingController tecIdentifiant = TextEditingController();
  TextEditingController tecPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Se connecter"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: tecIdentifiant,
                decoration: const InputDecoration(
                    hintText: 'Nom d\'utilisateur',
                    prefixIcon: Icon(Icons.person)
                ),
              ),
              TextFormField(
                controller: tecPwd,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Mot de passe',
                    prefixIcon: Icon(Icons.password)
                ),
              ),
              const Spacer(),
              ElevatedButton(onPressed: _connect, child: const Text('SE CONNECTER')),
              OutlinedButton(onPressed: ()=>Navigator.of(context).pushNamed("/register"), child: const Text('S\'INSCRIRE',)),

            ],
          ),
        ),
      ),
    );
  }

  _connect() async {
    //TODO récupérer les données depuis les tec
    String identifiant = tecIdentifiant.text;
    String password = tecPwd.text;
    //TODO envoyer ces données sur le serveur
    http.Response response = await http.post(
        Uri.parse("https://flutter-learning.mooo.com/auth/local/"),
        body:
        {
          "identifier" : identifiant,
          "password" : password,
        }
    );
    //ICI
    if(response.statusCode == 200){
      dev.log("login fone with success ${response.statusCode}");
      String jwt=jsonDecode(response.body)["jwt"];
      Navigator.of(context).pushNamed("/home_page");
      /*await*/ const FlutterSecureStorage().write(key: ConstStorage.KEY_JWT, value: "jwt").then(
          (value) =>  Navigator.of(context).pushNamed("/home_page"),
          onError: (_,var1)=> dev.log("impossible de save le token"));
      
    }else{
      dev.log("login done with error ${response.statusCode}");
      dev.log("login fone with error ${response.body.toString()}");

    }

  }
}
