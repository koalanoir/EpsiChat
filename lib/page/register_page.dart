import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //TODO Créer les controller text
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecUsername = TextEditingController();
  TextEditingController tecPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'inscrire"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: tecEmail,
                decoration: const  InputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: Icon(Icons.email)
                ),
              ),
              TextFormField(
                controller: tecUsername,
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
              ElevatedButton(onPressed: _register, child: const Text('S\'INSCRIRE',)),
              OutlinedButton(onPressed:()=>Navigator.of(context).pushNamed("/login"), child: const Text('SE CONNECTER')),
            ],
          ),
        ),
      ),
    );
  }
 _connect() async{
    
 }
  _register() async {
    //TODO récupérer les données depuis les tec
    String username = tecUsername.text;
    String email = tecEmail.text;
    String password = tecPwd.text;
    //TODO envoyer ces données sur le serveur
    http.Response response = await http.post(
      Uri.parse("cregister"),
      body:{
        "username" : username,
        "email" : email,
        "password" : password,
      }
    );
    //ICI
    if(response.statusCode == 200){
      dev.log("Register fone with success ${response.statusCode}");
    }else{
      dev.log("Register fone with error ${response.statusCode}");
      dev.log("Register fone with error ${response.body.toString()}");
    }
  }
}
